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

  Future<void> _requestRide() async {
    setState(() => loading = true);
    try {
      // Placeholder pickup/dropoff until map selection is implemented.
      final repo = ref.read(rideRepositoryProvider);
      final ride = await repo.requestRide(
        pickup: const LocationPoint(
          lat: 8.9806,
          lng: 38.7578,
          address: 'Addis Ababa',
        ),
        dropoff: const LocationPoint(
          lat: 8.9950,
          lng: 38.7890,
          address: 'Destination',
        ),
      );
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
          Expanded(
            child: Center(
              child: MapContainer(
                label:
                    lastRideId == null
                        ? 'Map Placeholder'
                        : 'Last ride: $lastRideId',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: loading ? null : _requestRide,
              child:
                  loading
                      ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : const Text('Request Ride'),
            ),
          ),
        ],
      ),
    );
  }
}
