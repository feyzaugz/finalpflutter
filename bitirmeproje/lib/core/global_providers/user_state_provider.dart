import 'package:bitirmeproje/core/models/user.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state_provider.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  AppUser? build() {
    state = null;
    listenUserChanges();

    return state;
  }

  listenUserChanges() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        getUser(event.uid);
      } else {
        state = null;
      }
    });
  }

  Future<void> getUser(String uid) async {
    state = await ref.read(firestoreRepositoryProvider).getUser(uid);
  }

  Future<bool> payDebt() async {
    try {
      await ref.read(firestoreRepositoryProvider).payDebt(state!.uid);
      AppUser user = state!;
      user.debt = 0;
      state = null;
      state = user;
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
