import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/core/models/announcement.dart';
import 'package:bitirmeproje/core/models/request.dart';
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

  Future<void> createNewAdvert(Advert newAdvert) async {
    return _ref.read(firestoreServiceProvider).createNewAdvert(newAdvert);
  }

  Future<List<Announcement>> getAnnouncement() async {
    return _ref.read(firestoreServiceProvider).getAnnouncement();
  }

  Future<void> addNewRequest(Request request) async {
    return _ref.read(firestoreServiceProvider).addNewRequest(request);
  }
}

@riverpod
FirestoreRepository firestoreRepository(ref) {
  return FirestoreRepository(ref);
}
