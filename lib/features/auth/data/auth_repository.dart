import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:multi_portal_training_management/shared/models/app_user.dart';

class AuthRepository {
  AuthRepository({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Stream<AppUser?> authState() {
    return _auth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;
      final profile =
          await _firestore.collection('users').doc(firebaseUser.uid).get();
      final roleString = (profile.data()?['role'] as String?) ?? 'unknown';

      return AppUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: profile.data()?['displayName'] as String?,
        role: _parseRole(roleString),
      );
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() => _auth.signOut();

  UserRole _parseRole(String value) {
    switch (value) {
      case 'admin':
        return UserRole.admin;
      case 'walkro':
        return UserRole.walkro;
      case 'trainer':
        return UserRole.trainer;
      case 'school':
        return UserRole.school;
      default:
        return UserRole.unknown;
    }
  }
}
