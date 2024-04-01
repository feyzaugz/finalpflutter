import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService();

  final _auth = FirebaseAuth.instance;

  void signOut() {
    _auth.signOut();
  }

  void updateLanguage(String? languageCode) {
    _auth.setLanguageCode(languageCode);
  }
}

@riverpod
AuthService authService(ref) {
  return AuthService();
}
