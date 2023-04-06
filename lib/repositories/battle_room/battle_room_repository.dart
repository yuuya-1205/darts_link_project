import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/battle_room.dart';

class BattleRoomRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final battleRoomsCollection = fireStore.collection('battleRooms');

  static Future<String> createBattleRoom(BattleRoom battleRoom) async {
    final room = await battleRoomsCollection.add(battleRoom.toJson());
    return room.id;
  }

  static Stream<List<BattleRoom>> battleRoomStream() {
    return battleRoomsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => BattleRoom.fromJson(doc.data()).copyWith(id: doc.id))
            .toList());
  }

  static Future<bool> canCreateBattleRoomMember(String roomId) async {
    final snapshot = await battleRoomsCollection.doc(roomId).get();
    final data = snapshot.data() as Map<String, dynamic>;
    int capacity = data['capacity'];
    int numberOfParticipants = data['numberOfParticipants'];
    if (capacity <= numberOfParticipants) {
      return false;
    }
    return true;
  }

  static Future<void> updateBattleRoom(BattleRoom battleRoom) async {
    print(battleRoom.id);
    await battleRoomsCollection
        .doc(battleRoom.id)
        .set(battleRoom.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteBattleRoom(BattleRoom battleRoom) async {
    await battleRoomsCollection.doc(battleRoom.id).delete();
  }

  static Future<void> updateProfile({
    required AppUser appUser,
  }) async {
    final snapshot = await battleRoomsCollection
        .where('ownerId', isEqualTo: appUser.id)
        .get();
    await Future.forEach(snapshot.docs, (QueryDocumentSnapshot element) async {
      await element.reference.set({
        'createrName': appUser.userName,
        'createrImage': appUser.userImage,
        'userId': appUser.userId,
      }, SetOptions(merge: true));
    });
  }

  static Future<List<BattleRoom>> fetchSearchedBattleRooms(String value) async {
    final result = await Future.wait(
        [fetchBattleRoomsByTitle(value), fetchBattleRoomsByDetail(value)]);

    /// toSetで重複するデータを排除し、更新日順で並び替え
    final battleRooms = result.expand((element) => element).toSet().toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return battleRooms;
  }

  static Future<List<BattleRoom>> fetchBattleRoomsByTitle(String value) async {
    final snapshot = await battleRoomsCollection
        .orderBy('title')
        .startAt([value]).endAt(['$value\uf8ff']).get();
    return snapshot.docs
        .map((doc) => BattleRoom.fromJson(doc.data()).copyWith(id: doc.id))
        .toList();
  }

  static Future<List<BattleRoom>> fetchBattleRoomsByDetail(String value) async {
    final snapshot = await battleRoomsCollection
        .orderBy('detail')
        .startAt([value]).endAt(['$value\uf8ff']).get();
    return snapshot.docs
        .map((doc) => BattleRoom.fromJson(doc.data()).copyWith(id: doc.id))
        .toList();
  }
}
