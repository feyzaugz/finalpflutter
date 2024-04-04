import 'package:bitirmeproje/core/models/user.dart';
import 'package:bitirmeproje/core/services/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository.g.dart';

class FirestoreRepository {
  final Ref _ref;
  FirestoreRepository(this._ref);

  Future<AppUser?> getUser(String uid) async {
    return _ref.read(firestoreServiceProvider).getUser(uid);
  }
}

@riverpod
FirestoreRepository firestoreRepository(ref) {
  return FirestoreRepository(ref);
}
