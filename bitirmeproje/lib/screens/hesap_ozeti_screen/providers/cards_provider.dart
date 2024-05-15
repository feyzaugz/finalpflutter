import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_provider.g.dart';

@Riverpod(keepAlive: true)
class Cards extends _$Cards {
  @override
  List<Map> build() {
    return [];
  }

  Future<bool> addNewCard(Map<String, dynamic> cardDetails, String uid) async {
    try {
      await ref.read(firestoreRepositoryProvider).addNewCard(cardDetails, uid);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
