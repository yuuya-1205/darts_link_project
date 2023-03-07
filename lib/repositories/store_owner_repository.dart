import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';

class StoreOwnerRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final storeOwnerCollection = fireStore.collection('storeOwners');
  static DocumentReference getDocumentRef(String uid) =>
      storeOwnerCollection.doc(uid);

  static Future<void> updateStoreOwner(StoreOwner storeOwner) async {
    await getDocumentRef(storeOwner.id)
        .set(storeOwner.toJson(), SetOptions(merge: true));
  }

  static Future<StoreOwner?> fetchStoreOwner(String uid) async {
    final snap = await getDocumentRef(uid).get();
    if (!snap.exists) {
      return null;
    }
    final storeOwner = StoreOwner.fromJson(snap.data() as Map<String, dynamic>)
        .copyWith(reference: snap.reference);

    return storeOwner;
  }

  static Stream<List<StoreOwner>> fetchNotApprovedStoreOwnerStream() {
    return storeOwnerCollection
        .where('isApproved', isEqualTo: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => StoreOwner.fromJson(e.data())).toList());
  }

  static Stream<List<StoreOwner>> storeOwnerStream() {
    return storeOwnerCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map(
              (doc) => StoreOwner.fromJson(doc.data())
                  .copyWith(id: doc.id, reference: doc.reference),
            )
            .toList());
  }
}
