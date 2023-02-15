import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/house_tornament.dart';

class HouseTornamentRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final houseTornamentsCollection =
      fireStore.collection('houseTornaments');
  static DocumentReference getDocumentRef(String houseTornamentId) =>
      houseTornamentsCollection.doc(houseTornamentId);

  static Future<String> createHouseTornament(
      HouseTornament houseTornament) async {
    final room = await houseTornamentsCollection.add(houseTornament.toJson());
    return room.id;
  }

  static Stream<List<HouseTornament>> circleStream() {
    return houseTornamentsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) =>
                HouseTornament.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Future<void> updateHouseTornament(
      HouseTornament houseTornament) async {
    await houseTornamentsCollection
        .doc(houseTornament.id)
        .set(houseTornament.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteCircle(HouseTornament houseTornament) async {
    await houseTornamentsCollection.doc(houseTornament.id).delete();
  }
}
