import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/repositories/ride_repository.dart';
import '../../models/ride.dart';
import '../../core/widgets/map_container.dart';

class PassengerHomePage extends ConsumerStatefulWidget {
  const PassengerHomePage({super.key});

  @override
  ConsumerState<PassengerHomePage> createState() => _PassengerHomePageState();
}

class _PassengerHomePageState extends ConsumerState<PassengerHomePage> {
  bool loading = false;
  String? lastRideId;
  final _pickupCtrl = TextEditingController();
  final _dropoffCtrl = TextEditingController();
  LocationPoint? _pickup;
  LocationPoint? _dropoff;

  Future<void> _requestRide() async {
    setState(() => loading = true);
    try {
      final repo = ref.read(rideRepositoryProvider);
      // Build points from typed addresses (lat/lng 0 for now; to be replaced by geocoding)
      if (_pickupCtrl.text.trim().isEmpty || _dropoffCtrl.text.trim().isEmpty) {
        throw StateError('Please enter both pickup and dropoff addresses');
      }
      _pickup = LocationPoint(
        lat: 0.0,
        lng: 0.0,
        address: _pickupCtrl.text.trim(),
      );
      _dropoff = LocationPoint(
        lat: 0.0,
        lng: 0.0,
        address: _dropoffCtrl.text.trim(),
      );
      final ride = await repo.requestRide(pickup: _pickup!, dropoff: _dropoff!);
      setState(() => lastRideId = ride.id);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ride requested: ${ride.id}')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error requesting ride: $e')));
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Home')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where to?',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Type your pickup and dropoff addresses',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: loading ? null : _requestRide,
                      icon: const Icon(Icons.local_taxi_outlined),
                      label: Text(loading ? 'Requesting...' : 'Request Ride'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _pickupCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Pickup address',
                    prefixIcon: Icon(Icons.my_location_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _dropoffCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Dropoff address',
                    prefixIcon: Icon(Icons.place_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: const MapContainer(label: 'Map disabled'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Consumer(
              builder: (context, ref, _) {
                final active = ref.watch(passengerActiveRideProvider);
                return active.when(
                  loading: () => const SizedBox(height: 4),
                  error: (e, st) => Text('Ride stream error: $e'),
                  data: (ride) {
                    if (ride == null) return const SizedBox.shrink();
                    final canCancel =
                        ride.status == 'searching' || ride.status == 'assigned';
                    return Card(
                      child: ListTile(
                        title: Text('Current ride: ${ride.id.substring(0, 6)}'),
                        subtitle: Text('Status: ${ride.status}'),
                        trailing:
                            canCancel
                                ? TextButton(
                                  onPressed: () async {
                                    await ref
                                        .read(rideRepositoryProvider)
                                        .cancelRide(rideId: ride.id);
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('Ride cancelled'),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Cancel'),
                                )
                                : null,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
