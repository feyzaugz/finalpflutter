import 'package:bitirmeproje/core/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Ref _ref;
  AuthRepository(this._ref);

  void signOut() {
    _ref.read(authServiceProvider).signOut();
  }

  void updateLanguage(String? v) {
    _ref.read(authServiceProvider).updateLanguage(v);
  }
}

@riverpod
AuthRepository authRepository(ref) {
  return AuthRepository(ref);
}
