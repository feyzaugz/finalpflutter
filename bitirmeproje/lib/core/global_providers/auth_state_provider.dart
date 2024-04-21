import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/auth_repository.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  AuthState() {
    listenUserChanges();
  }
  @override
  User? build() {
    state = null;
    return state;
  }

  listenUserChanges() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      print("Auth state event $event");
      state = event;
    });
  }

  void signOut() {
    ref.read(authRepositoryProvider).signOut();
  }

  void updateLanguage(String? v) {
    ref.read(authRepositoryProvider).updateLanguage(v);
  }

  Future<bool> changePassword(BuildContext context, String newPassword) async {
    try {
      await state?.updatePassword(newPassword);
      return true;
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            content: Text(
              e.message.toString(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Ok"),
              )
            ],
          ),
        );
      }
      return false;
    }
  }

  Future<void> getUser() async {
    try {
      state = await ref.read(authRepositoryProvider).getUser();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }
}
