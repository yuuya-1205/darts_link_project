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
    await battleRoomsCollection.doc(battleRoom.id).update(
          battleRoom.toJson(),
        );
    print(battleRoom.id);
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
}
