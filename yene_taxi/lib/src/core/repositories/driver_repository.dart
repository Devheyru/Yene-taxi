import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';
import '../../models/driver_profile.dart';

final driverRepositoryProvider = Provider<DriverRepository>((ref) {
  return DriverRepository(
    db: ref.watch(firestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
});

final driverProfileProvider = StreamProvider<DriverProfile?>((ref) {
  final repo = ref.watch(driverRepositoryProvider);
  return repo.watchCurrentDriverProfile();
});

final pendingDriversProvider = StreamProvider<List<DriverProfile>>((ref) {
  final repo = ref.watch(driverRepositoryProvider);
  return repo.watchDriversByStatus('pending');
});

class DriverRepository {
  final FirebaseFirestore db;
  final fba.FirebaseAuth auth;
  DriverRepository({required this.db, required this.auth});

  CollectionReference<Map<String, dynamic>> get _col =>
      db.collection('drivers');

  Stream<DriverProfile?> watchCurrentDriverProfile() {
    return auth.authStateChanges().asyncExpand((user) {
      if (user == null) return Stream.value(null);
      return _col.doc(user.uid).snapshots().map((d) {
        if (!d.exists) return null;
        final data = d.data()!..putIfAbsent('id', () => d.id);
        return DriverProfile.fromJson(data);
      });
    });
  }

  Stream<List<DriverProfile>> watchDriversByStatus(String status) {
    return _col
        .where('status', isEqualTo: status)
        .snapshots()
        .map(
          (q) =>
              q.docs
                  .map(
                    (d) => DriverProfile.fromJson(
                      d.data()..putIfAbsent('id', () => d.id),
                    ),
                  )
                  .toList(),
        );
  }

  Future<void> setOnline(String userId, bool online) async {
    await _col.doc(userId).set({'isOnline': online}, SetOptions(merge: true));
  }

  Future<void> approve(String userId) async {
    await _col.doc(userId).set({'status': 'approved'}, SetOptions(merge: true));
  }

  Future<void> updateLocation(String userId, GeoPointData point) async {
    await _col.doc(userId).set({
      'currentLocation': point.toJson(),
    }, SetOptions(merge: true));
  }
}
