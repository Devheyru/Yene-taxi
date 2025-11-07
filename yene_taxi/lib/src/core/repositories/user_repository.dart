import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';
import '../../models/user_model.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(
    db: ref.watch(firestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
});

class UserRepository {
  final FirebaseFirestore db;
  final fba.FirebaseAuth auth;
  UserRepository({required this.db, required this.auth});

  CollectionReference<Map<String, dynamic>> get _col => db.collection('users');

  Stream<AppUser?> watchCurrentUser() {
    return auth.authStateChanges().asyncExpand((user) {
      if (user == null) return Stream.value(null);
      return _col.doc(user.uid).snapshots().map((d) {
        if (!d.exists) return null;
        final data = d.data()!..putIfAbsent('id', () => d.id);
        return AppUser.fromJson(data);
      });
    });
  }

  Future<void> updateCurrentUser(Map<String, dynamic> data) async {
    final u = auth.currentUser;
    if (u == null) return;
    await _col.doc(u.uid).set(data, SetOptions(merge: true));
  }
}
