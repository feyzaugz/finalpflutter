import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/core/models/announcement.dart';
import 'package:bitirmeproje/core/models/guest.dart';
import 'package:bitirmeproje/core/models/privilege.dart';
import 'package:bitirmeproje/core/models/request.dart';
import 'package:bitirmeproje/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_service.g.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  FirestoreService();

  Future<AppUser?> getUser(String uid) async {
    DocumentSnapshot<AppUser> doc = await db
        .collection('users')
        .doc(uid)
        .withConverter<AppUser>(
          fromFirestore: (user, _) => AppUser.fromJson(user.data()!),
          toFirestore: (user, _) => user.toJson(),
        )
        .get();

    if (doc.data() == null) {
      return createUser(uid);
    }

    return doc.data();
  }

  Future<AppUser> createUser(String uid) async {
    await db
        .collection('users')
        .doc(uid)
        .set({"uid": uid, "debt": 100, "name": "", "lastName": ""});
    return AppUser(uid: uid, name: "", debt: 100, lastName: "");
  }

  Future<List<Advert>> getAdverts() async {
    List<Advert> ilanlar = [];

    QuerySnapshot<Advert> doc = await db
        .collection('ilanlar')
        .withConverter<Advert>(
          fromFirestore: (user, _) => Advert.fromJson(user.data()!),
          toFirestore: (user, _) => user.toJson(),
        )
        .get();

    for (var ilan in doc.docs) {
      ilanlar.add(ilan.data());
    }

    return ilanlar;
  }

  Future<void> createNewAdvert(Advert newAdvert) async {
    await db.collection("ilanlar").add(newAdvert.toJson());
  }

  Future<List<Announcement>> getAnnouncement() async {
    List<Announcement> announcements = [];

    QuerySnapshot<Announcement> doc = await db
        .collection('announcements')
        .withConverter<Announcement>(
          fromFirestore: (announcement, _) =>
              Announcement.fromJson(announcement.data()!),
          toFirestore: (announcement, _) => announcement.toJson(),
        )
        .get();

    for (var announcement in doc.docs) {
      announcements.add(announcement.data());
    }

    return announcements;
  }

  Future<void> addNewRequest(Request request) async {
    await db.collection("requests").add(request.toJson());
  }

  Future<void> payDebt(String uid) async {
    await db.collection("users").doc(uid).update({"debt": 0});
  }

  Future<List<Privilege>> getPrivileges() async {
    List<Privilege> privileges = [];

    QuerySnapshot<Privilege> doc = await db
        .collection('privileges')
        .withConverter<Privilege>(
          fromFirestore: (announcement, _) =>
              Privilege.fromJson(announcement.data()!),
          toFirestore: (announcement, _) => announcement.toJson(),
        )
        .get();

    for (var announcement in doc.docs) {
      privileges.add(announcement.data());
    }

    return privileges;
  }

  Future<void> addNewCard(Map<String, dynamic> cardDetails, String uid) async {
    await db.collection("users").doc(uid).collection("cards").add(cardDetails);
  }

  Future<void> addGuest(Map<String, dynamic> guest) async {
    await db.collection("guests").add(guest);
  }

  Future<List<Guest>> getGuests() async {
    List<Guest> guests = [];

    QuerySnapshot<Guest> doc = await db
        .collection('guests')
        .withConverter<Guest>(
          fromFirestore: (announcement, _) =>
              Guest.fromJson(announcement.data()!),
          toFirestore: (announcement, _) => announcement.toJson(),
        )
        .get();

    for (var guest in doc.docs) {
      guests.add(guest.data());
    }

    return guests;
  }

  Future<List<Map>> getCards(String uid) async {
    List<Map> cards = [];
    QuerySnapshot query =
        await db.collection("users").doc(uid).collection("cards").get();
    for (var card in query.docs) {
      cards.add(card.data() as Map);
    }

    return cards;
  }
}

@riverpod
FirestoreService firestoreService(ref) {
  return FirestoreService();
}
