import 'package:bitirmeproje/core/models/advert.dart';
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

  Future<List<Advert>> getAdverts() async {
    List<Advert> ilanlar =
        await _ref.read(firestoreServiceProvider).getAdverts();
    for (Advert advert in ilanlar) {
      advert.advertiser = await _ref
          .read(firestoreServiceProvider)
          .getUser(advert.advertiserId);
    }
    return ilanlar;
  }
}

@riverpod
FirestoreRepository firestoreRepository(ref) {
  return FirestoreRepository(ref);
}
