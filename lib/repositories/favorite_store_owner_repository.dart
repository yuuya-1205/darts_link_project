import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/repositories/person_repository.dart';

import '../models/app_user.dart';

class FavoriteStoreOwnerRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getFavoriteCollection(String uid) =>
      PersonRepository.personCollection
          .doc(uid)
          .collection('favoriteStoreOwners');

  static Future<void> setFavorite({
    required String myUid,
    required StoreOwner storeOwner,
  }) async {
    await getFavoriteCollection(myUid).doc(storeOwner.id).set({
      'userName': storeOwner.userName,
      'userImage': storeOwner.userImage,
      'userId': storeOwner.userId,
      'createdAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  static Future<void> unFavorite(
      {required String myUid, required String storeOwnerId}) async {
    await getFavoriteCollection(myUid).doc(storeOwnerId).delete();
  }

  static Stream<DocumentSnapshot> favoriteStream({
    required String myUid,
    required String storeOwnerId,
  }) {
    return getFavoriteCollection(myUid).doc(storeOwnerId).snapshots();
  }
}
