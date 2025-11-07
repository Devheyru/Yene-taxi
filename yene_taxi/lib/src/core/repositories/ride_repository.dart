import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';
import '../../models/ride.dart';

final rideRepositoryProvider = Provider<RideRepository>((ref) {
  return RideRepository(
    db: ref.watch(firestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
});

final openRidesProvider = StreamProvider<List<Ride>>((ref) {
  final repo = ref.watch(rideRepositoryProvider);
  return repo.watchOpenRides();
});

class RideRepository {
  final FirebaseFirestore db;
  final fba.FirebaseAuth auth;
  RideRepository({required this.db, required this.auth});

  CollectionReference<Map<String, dynamic>> get _col => db.collection('rides');

  Future<Ride> requestRide({
    required LocationPoint pickup,
    required LocationPoint dropoff,
  }) async {
    final user = auth.currentUser;
    if (user == null) {
      throw StateError('Not signed in');
    }
    final doc = _col.doc();
    final ride = Ride(
      id: doc.id,
      passengerId: user.uid,
      pickup: pickup,
      dropoff: dropoff,
      status: 'searching',
    );
    await doc.set(ride.toJson());
    return ride;
  }

  Stream<List<Ride>> watchOpenRides() {
    return _col
        .where('status', isEqualTo: 'searching')
        .snapshots()
        .map(
          (q) =>
              q.docs
                  .map(
                    (d) =>
                        Ride.fromJson(d.data()..putIfAbsent('id', () => d.id)),
                  )
                  .toList(),
        );
  }

  Future<void> acceptRide({required String rideId}) async {
    final user = auth.currentUser;
    if (user == null) throw StateError('Not signed in');
    await _col.doc(rideId).set({
      'driverId': user.uid,
      'status': 'assigned',
    }, SetOptions(merge: true));
  }

  Stream<List<Ride>> watchDriverAssignedRides(String driverId) {
    return _col
        .where('driverId', isEqualTo: driverId)
        .where('status', whereIn: ['assigned', 'onTrip'])
        .snapshots()
        .map(
          (q) =>
              q.docs
                  .map(
                    (d) =>
                        Ride.fromJson(d.data()..putIfAbsent('id', () => d.id)),
                  )
                  .toList(),
        );
  }
}
