import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ilanlar_provider.g.dart';

@Riverpod(keepAlive: true)
class Ilanlar extends _$Ilanlar {
  @override
  List<Advert> build() {
    getAdverts();
    return [];
  }

  Future<void> getAdverts() async {
    state = await ref.read(firestoreRepositoryProvider).getAdverts();
  }

  Future<bool> createNewAdvert(Advert newAdvert) async {
    try {
      await ref.read(firestoreRepositoryProvider).createNewAdvert(newAdvert);
      getAdverts();
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
