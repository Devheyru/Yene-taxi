import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/repositories/driver_repository.dart';
import '../../core/services/location_service.dart';
import '../../core/widgets/map_container.dart';

class DriverHomePage extends ConsumerWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(driverProfileProvider);
    final locAsync = ref.watch(currentLocationProvider);
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
                const SizedBox(height: 24),
                Expanded(
                  child: Center(
                    child: MapContainer(
                      label: 'Incoming Ride / Map Placeholder',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
