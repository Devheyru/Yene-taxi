import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/repositories/driver_repository.dart';
import '../../core/repositories/ride_repository.dart';
import '../../core/services/location_service.dart';
import '../../core/widgets/map_container.dart';
import '../../models/driver_profile.dart';
import '../../models/ride.dart';

// Throttle helpers for auto location sync (simple file-scoped cache)
DateTime? _lastLocationUpdate;
GeoPointData? _lastSentPoint;

// Assigned rides stream for the current driver
final driverAssignedRidesProvider = StreamProvider<List<Ride>>((ref) {
  final profileAsync = ref.watch(driverProfileProvider);
  final profile = profileAsync.value;
  if (profile == null) return const Stream<List<Ride>>.empty();
  final repo = ref.watch(rideRepositoryProvider);
  return repo.watchDriverAssignedRides(profile.id);
});

double _haversineMeters(double lat1, double lon1, double lat2, double lon2) {
  const r = 6371000.0; // meters
  final dLat = (lat2 - lat1) * (3.141592653589793 / 180.0);
  final dLon = (lon2 - lon1) * (3.141592653589793 / 180.0);
  final a =
      (math.sin(dLat / 2) * math.sin(dLat / 2)) +
      math.cos(lat1 * (3.141592653589793 / 180.0)) *
          math.cos(lat2 * (3.141592653589793 / 180.0)) *
          (math.sin(dLon / 2) * math.sin(dLon / 2));
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return r * c;
}

class DriverHomePage extends ConsumerWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(driverProfileProvider);
    final locAsync = ref.watch(currentLocationProvider);
    // Auto-sync driver location when online (throttled)
    ref.listen(currentLocationProvider, (prev, next) async {
      final profile = ref.read(driverProfileProvider).value;
      if (profile == null || profile.isOnline != true) return;
      final point = next.value;
      if (point == null) return;
      final lastTime = _lastLocationUpdate;
      final lastPoint = _lastSentPoint;
      final now = DateTime.now();
      const minInterval = Duration(seconds: 15);
      final movedEnough =
          lastPoint == null
              ? true
              : _haversineMeters(
                    lastPoint.lat,
                    lastPoint.lng,
                    point.lat,
                    point.lng,
                  ) >
                  20; // meters
      if ((lastTime == null || now.difference(lastTime) >= minInterval) &&
          movedEnough) {
        final repo = ref.read(driverRepositoryProvider);
        await repo.updateLocation(
          profile.id,
          GeoPointData(lat: point.lat, lng: point.lng),
        );
        _lastLocationUpdate = now;
        _lastSentPoint = GeoPointData(lat: point.lat, lng: point.lng);
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: profileAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
          data: (profile) {
            final repo = ref.read(driverRepositoryProvider);
            final isOnline = profile?.isOnline ?? false;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Status:'),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(isOnline ? 'ONLINE' : 'OFFLINE'),
                      backgroundColor: isOnline ? Colors.green : Colors.red,
                    ),
                    const Spacer(),
                    Switch(
                      value: isOnline,
                      onChanged: (v) async {
                        final userId = profile?.id;
                        if (userId != null) {
                          await repo.setOnline(userId, v);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                locAsync.when(
                  loading: () => const Text('Locating...'),
                  error: (e, st) => Text('Location error: $e'),
                  data:
                      (point) => Text(
                        point == null
                            ? 'Location unavailable'
                            : 'Location: ${point.lat.toStringAsFixed(5)}, ${point.lng.toStringAsFixed(5)}',
                      ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: MapContainer(label: 'Incoming Ride / Map Placeholder'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Open rides',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Consumer(
                  builder: (context, ref, _) {
                    final ridesAsync = ref.watch(openRidesProvider);
                    return ridesAsync.when(
                      loading: () => const LinearProgressIndicator(),
                      error: (e, st) => Text('Failed to load rides: $e'),
                      data: (rides) {
                        if (rides.isEmpty) return const Text('No open rides');
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: rides.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final r = rides[index];
                            return ListTile(
                              title: Text(
                                'Pickup: ${r.pickup.lat.toStringAsFixed(4)}, ${r.pickup.lng.toStringAsFixed(4)}',
                              ),
                              subtitle: Text(
                                'Dropoff: ${r.dropoff.lat.toStringAsFixed(4)}, ${r.dropoff.lng.toStringAsFixed(4)}',
                              ),
                              trailing: ElevatedButton(
                                onPressed: () async {
                                  final repo = ref.read(rideRepositoryProvider);
                                  await repo.acceptRide(rideId: r.id);
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Ride accepted'),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Accept'),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Assigned to you',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Consumer(
                  builder: (context, ref, _) {
                    final assignedAsync = ref.watch(
                      driverAssignedRidesProvider,
                    );
                    return assignedAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (e, st) => Text('Failed to load assigned: $e'),
                      data: (rides) {
                        if (rides.isEmpty)
                          return const Text('No assigned rides');
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: rides.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final r = rides[index];
                            return ListTile(
                              title: Text('Ride #${r.id.substring(0, 6)}'),
                              subtitle: Text('Status: ${r.status}'),
                              trailing: _RideActionButtons(ride: r),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _RideActionButtons extends ConsumerWidget {
  final Ride ride;
  const _RideActionButtons({required this.ride});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(rideRepositoryProvider);
    if (ride.status == 'assigned') {
      return TextButton(
        onPressed: () async {
          await repo.startTrip(rideId: ride.id);
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Trip started')));
          }
        },
        child: const Text('Start Trip'),
      );
    }
    if (ride.status == 'onTrip') {
      return TextButton(
        onPressed: () async {
          await repo.completeRide(rideId: ride.id);
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Ride completed')));
          }
        },
        child: const Text('Complete'),
      );
    }
    return const SizedBox.shrink();
  }
}
