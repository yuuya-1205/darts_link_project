import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/member.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';

class BattleRoomMemberRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getBattleRoomsMemberCollection(
          String battleRoomId) =>
      BattleRoomRepository.battleRoomsCollection
          .doc(battleRoomId)
          .collection('members');

  static Future<List<Member>> fetchBattleRoomMembers(
      String battleRoomId) async {
    final snap = await getBattleRoomsMemberCollection(battleRoomId).get();
    List<Member> list = snap.docs
        .map((e) {
          return Member.fromJson(e.data() as Map<String, dynamic>);
        })
        .whereType<Member>()
        .toList();
    return list;
  }

  static Future<void> createBattleRoomMember({
    required String battleRoomId,
    required Member member,
  }) async {
    await getBattleRoomsMemberCollection(battleRoomId)
        .doc(member.uid)
        .set(member.toJson());
  }

  static Future<void> leaveBattleRoomMember({
    required String battleRoomId,
    required String memberId,
  }) async {
    await getBattleRoomsMemberCollection(battleRoomId).doc(memberId).delete();
  }

  static Future<Member> setMember({
    required String battleRoomId,
    required AppUser appUser,
  }) async {
    final member = Member(
        uid: appUser.id,
        userName: appUser.userName,
        userId: appUser.userId,
        userImage: appUser.userImage,
        joinedAt: Timestamp.now());
    await getBattleRoomsMemberCollection(battleRoomId)
        .doc()
        .set(member.toJson(), SetOptions(merge: true));
    return member;
  }

  static Future<int> fetchMemberDocsCount(String battleRoomId) async {
    final query =
        await getBattleRoomsMemberCollection(battleRoomId).count().get();
    return query.count;
  }
}
