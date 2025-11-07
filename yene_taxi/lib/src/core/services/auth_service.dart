import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Google Sign-In handled via FirebaseAuth's GoogleAuthProvider on all platforms.

import '../../../src/models/user_model.dart';

final firebaseAuthProvider = Provider<fba.FirebaseAuth>(
  (ref) => fba.FirebaseAuth.instance,
);
final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    auth: ref.watch(firebaseAuthProvider),
    db: ref.watch(firestoreProvider),
  ),
);

final authStateChangesProvider = StreamProvider<fba.User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

final userDocProvider = StreamProvider<AppUser?>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return repo.currentUserDoc$;
});

final userRoleProvider = Provider<String?>((ref) {
  final userDoc = ref
      .watch(userDocProvider)
      .maybeWhen(data: (d) => d, orElse: () => null);
  return userDoc?.role;
});

class AuthRepository {
  final fba.FirebaseAuth auth;
  final FirebaseFirestore db;

  AuthRepository({required this.auth, required this.db});

  Stream<fba.User?> get authStateChanges => auth.authStateChanges();

  Stream<AppUser?> get currentUserDoc$ async* {
    await for (final user in authStateChanges) {
      if (user == null) {
        yield null;
        continue;
      }
      yield* db.collection('users').doc(user.uid).snapshots().map((snap) {
        if (!snap.exists) return null;
        final data = snap.data()!..putIfAbsent('id', () => snap.id);
        return AppUser.fromJson(data);
      });
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    // Google Sign-In sign out is no longer needed.
  }

  Future<AppUser> _ensureUserDoc({
    required fba.User user,
    String defaultRole = 'passenger',
  }) async {
    final ref = db.collection('users').doc(user.uid);
    final snap = await ref.get();
    if (!snap.exists) {
      final appUser = AppUser(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName,
        photoUrl: user.photoURL,
        role: defaultRole,
      );
      await ref.set(appUser.toJson());
      return appUser;
    } else {
      final data = snap.data()!..putIfAbsent('id', () => snap.id);
      return AppUser.fromJson(data);
    }
  }

  Future<AppUser> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final cred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _ensureUserDoc(user: cred.user!);
  }

  Future<AppUser> registerWithEmail({
    required String email,
    required String password,
  }) async {
    final cred = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _ensureUserDoc(user: cred.user!);
  }

  Future<AppUser> signInWithGoogle() async {
    final provider = fba.GoogleAuthProvider();
    final userCred =
        kIsWeb
            ? await auth.signInWithPopup(provider)
            : await auth.signInWithProvider(provider);
    return _ensureUserDoc(user: userCred.user!);
  }
}
