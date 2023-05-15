import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/favorite_store_owner.dart';
import 'package:darts_link_project/repositories/person_repository.dart';

import '../models/app_user.dart';

class FavoriteStoreOwnerRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference<FavoriteStoreOwner?> getFavoriteCollection(
          String uid) =>
      PersonRepository.personCollection
          .doc(uid)
          .collection('favoriteStoreOwners')
          .withConverter(
            fromFirestore: (snapshot, _) =>
                FavoriteStoreOwner.fromJson(snapshot.data() ?? {})
                    .copyWith(id: snapshot.id),
            toFirestore: (value, _) {
              final data = value?.toJson();
              data?.remove('id');
              return data ?? {};
            },
          );

  static Future<void> setFavorite({
    required String myUid,
    required StoreOwner storeOwner,
  }) async {
    await getFavoriteCollection(myUid).doc(storeOwner.id).set(
        FavoriteStoreOwner(
          id: storeOwner.id,
          userName: storeOwner.userName,
          userImage: storeOwner.userImage,
          userId: storeOwner.userId,
          createdAt: Timestamp.now(),
        ),
        SetOptions(merge: true));
  }

  static Future<void> unFavorite({
    required String myUid,
    required String storeOwnerId,
  }) async {
    await getFavoriteCollection(myUid).doc(storeOwnerId).delete();
  }

  static Stream<DocumentSnapshot> favoriteStoreOwnerDocStream({
    required String myUid,
    required String storeOwnerId,
  }) {
    return getFavoriteCollection(myUid).doc(storeOwnerId).snapshots();
  }

  static Stream<QuerySnapshot<FavoriteStoreOwner?>> favoriteStoreOwnerStream({
    required String myUid,
  }) {
    return getFavoriteCollection(myUid).snapshots();
  }
}
