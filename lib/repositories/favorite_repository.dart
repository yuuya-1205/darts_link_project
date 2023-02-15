import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/favorite.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';

class FavoriteRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getFavoriteCollection(String uid) =>
      StoreOwnerRepository.storeOwnerCollection
          .doc(uid)
          .collection('favorites');

  static Future<void> setFavorite({
    required String favoriteId,
    required Favorite favorite,
  }) async {
    await getFavoriteCollection(favoriteId)
        .doc(favorite.favoriteId)
        .set(favorite.toJson(), SetOptions(merge: true));
  }

  static Future<void> unFavorite(
      {required String favoriteId, required String uid}) async {
    await getFavoriteCollection(uid).doc(favoriteId).delete();
  }

  static Stream<QuerySnapshot> favoriteStream({
    required String uid,
    required String favoriteId,
  }) {
    return getFavoriteCollection(uid)
        .where('favoriteId', isEqualTo: favoriteId)
        .snapshots();
  }
}
