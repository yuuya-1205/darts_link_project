import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/circle/circle.dart';

class CircleRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final circlesCollection = fireStore.collection('circles');
  static DocumentReference getDocumentRef(String circleId) =>
      circlesCollection.doc(circleId);

  static Future<String> createCircle(Circle circle) async {
    final room = await circlesCollection.add(circle.toJson());
    return room.id;
  }

  static Stream<List<Circle>> circleStream() {
    return circlesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map(
                (doc) => Circle.fromJson(doc.data()).copyWith(circleId: doc.id))
            .toList());
  }

  static Future<bool> canCreateBattleRoomMember(String roomId) async {
    final snapshot = await circlesCollection.doc(roomId).get();
    final data = snapshot.data() as Map<String, dynamic>;
    int capacity = data['capacity'];
    int numberOfParticipants = data['numberOfParticipants'];
    if (capacity <= numberOfParticipants) {
      return false;
    }
    return true;
  }

  static Future<void> updateCircle(Circle circle) async {
    await circlesCollection
        .doc(circle.circleId)
        .set(circle.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteCircle(Circle circle) async {
    await circlesCollection.doc(circle.circleId).delete();
  }

  static Future<List<Circle>> fetchSearchedCircles(String value) async {
    final result = await Future.wait(
        [fetchCirclesByName(value), fetchCirclesByDetail(value)]);

    /// toSetで重複するデータを排除し、更新日順で並び替え
    final circles = result.expand((element) => element).toSet().toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return circles;
  }

  static Future<List<Circle>> fetchCirclesByName(String value) async {
    final snapshot = await circlesCollection
        .orderBy('circleName')
        .startAt([value]).endAt(['$value\uf8ff']).get();

    return snapshot.docs
        .map((doc) => Circle.fromJson(doc.data()).copyWith(circleId: doc.id))
        .toList();
  }

  static Future<List<Circle>> fetchCirclesByDetail(String value) async {
    final snapshot = await circlesCollection
        .orderBy('circleDetail')
        .startAt([value]).endAt(['$value\uf8ff']).get();

    return snapshot.docs
        .map((doc) => Circle.fromJson(doc.data()).copyWith(circleId: doc.id))
        .toList();
  }

  // static Future<void> updateProfile({
  //   required AppUser appUser,
  // }) async {
  //   final snapshot = await battleRoomsCollection
  //       .where('ownerId', isEqualTo: appUser.id)
  //       .get();
  //   await Future.forEach(snapshot.docs, (QueryDocumentSnapshot element) async {
  //     await element.reference.set({
  //       'createrName': appUser.userName,
  //       'createrImage': appUser.userImage,
  //       'userId': appUser.userId,
  //     }, SetOptions(merge: true));
  //   });
  // }
}
