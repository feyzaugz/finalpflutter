import 'package:bitirmeproje/core/global_providers/auth_state_provider.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_provider.g.dart';

@Riverpod(keepAlive: true)
class Cards extends _$Cards {
  @override
  List<Map> build() {
    getCards();
    return [];
  }

  getCards() async {
    try {
      String? uid = ref.read(authStateProvider)?.uid;
      if (uid != null) {
        state = await ref.read(firestoreRepositoryProvider).getCards(uid);
      }
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> addNewCard(Map<String, dynamic> cardDetails, String uid) async {
    try {
      await ref.read(firestoreRepositoryProvider).addNewCard(cardDetails, uid);
     getCards();
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
