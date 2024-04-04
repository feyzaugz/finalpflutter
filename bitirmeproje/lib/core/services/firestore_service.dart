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
    return AppUser(uid: uid, debt: 100);
  }
}

@riverpod
FirestoreService firestoreService(ref) {
  return FirestoreService();
}
