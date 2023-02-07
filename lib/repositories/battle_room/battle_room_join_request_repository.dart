import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/join_request.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';

class BattleRoomJoinRequestRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getBattleRoomJoinRequestCollection(
          String battleRoomId) =>
      BattleRoomRepository.battleRoomsCollection
          .doc(battleRoomId)
          .collection('joinRequests');

  static Future<List<JoinRequest>> fetchBattleRoomJoinRequests(
      String battleRoomId) async {
    final snap = await getBattleRoomJoinRequestCollection(battleRoomId).get();
    List<JoinRequest> list = snap.docs
        .map((e) {
          return JoinRequest.fromJson(e.data() as Map<String, dynamic>);
        })
        .whereType<JoinRequest>()
        .toList();
    return list;
  }

  static Future<void> createBattleRoomJoinRequest({
    required String battleRoomId,
    required JoinRequest joinRequest,
  }) async {
    await getBattleRoomJoinRequestCollection(battleRoomId)
        .doc(joinRequest.uid)
        .set(joinRequest.toJson());
  }

  static Future<JoinRequest?> fetchBattleRoomJoinRequest({
    required String battleRoomId,
    required String uid,
  }) async {
    final snap =
        await getBattleRoomJoinRequestCollection(battleRoomId).doc(uid).get();
    if (snap.data() == null) {
      return null;
    }
    final joinRequest =
        JoinRequest.fromJson(snap.data() as Map<String, dynamic>);
    return joinRequest;
  }

  static Future<void> deleteBattleRoomJoinRequest({
    required String battleRoomId,
    required String uid,
  }) async {
    await getBattleRoomJoinRequestCollection(battleRoomId).doc(uid).delete();
  }
}
