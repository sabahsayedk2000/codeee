import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:multi_portal_training_management/features/auth/data/auth_repository.dart';
import 'package:multi_portal_training_management/shared/models/app_user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).authState();
});

class AuthController {
  AuthController(this._repository);

  final AuthRepository _repository;

  Future<void> signIn({required String email, required String password}) {
    return _repository.signIn(email: email, password: password);
  }

  Future<void> signOut() => _repository.signOut();
}

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});
