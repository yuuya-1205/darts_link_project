import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/fcm_token.dart';
import 'package:darts_link_project/services/firestore_service.dart';

class FcmTokenRepository {
  static CollectionReference<FcmToken?> get _collection =>
      FirestoreService.firestore
          .collection('fcmTokens')
          .withConverter<FcmToken?>(
            fromFirestore: (snapshot, _) => FcmToken.fromSnapshot(snapshot),
            toFirestore: (value, _) {
              final data = value?.toJson();
              data?.remove('reference');
              return data ?? {};
            },
          );

  static DocumentReference<FcmToken?> _docRef(String docId) =>
      _collection.doc(docId);

  static Future<void> createFcmToken(
    DocumentReference userRef,
    String token,
  ) async {
    await _docRef(userRef.id).set(
      FcmToken(
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
        userReference: userRef,
        fcmTokens: [token],
      ),
      SetOptions(merge: true),
    );
  }

  static Future<FcmToken?> fetchFcmToken(String uid) async {
    final snapshot = await _docRef(uid).get();
    return snapshot.data();
  }

  static Future<void> updateFcmToken(String uid, String token) async {
    await _docRef(uid).update(FcmToken.toUpdateJson(token));
  }
}
