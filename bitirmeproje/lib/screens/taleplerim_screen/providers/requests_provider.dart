import 'package:bitirmeproje/core/models/request.dart';
import 'package:bitirmeproje/core/repositories/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'requests_provider.g.dart';

@Riverpod(keepAlive: true)
class Requests extends _$Requests {
  @override
  List<Request> build() {
    getAnnouncement();

    return [];
  }

  Future<void> getAnnouncement() async {
    // state = await ref.read(firestoreRepositoryProvider).getAnnouncement();
  }

  Future<bool> addNewRequest(Request request) async {
    try {
      await ref.read(firestoreRepositoryProvider).addNewRequest(request);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
