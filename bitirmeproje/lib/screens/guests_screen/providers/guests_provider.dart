import 'package:bitirmeproje/core/models/guest.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guests_provider.g.dart';

@Riverpod(keepAlive: true)
class Guests extends _$Guests {
  @override
  List<Guest> build() {
    getGuests();
    return [];
  }

  Future<void> getGuests() async {
    try {
      state = await ref.read(firestoreRepositoryProvider).getGuests();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> addGuest(Map<String, dynamic> guest) async {
    try {
      await ref.read(firestoreRepositoryProvider).addGuest(guest);
      getGuests();
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
