import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_member.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';

class HouseTornamentMemberRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference gethouseTornamentsMemberCollection(
          String houseTornamentId) =>
      HouseTournamentRepository.houseTournamentsCollection
          .doc(houseTornamentId)
          .collection('houseTornamentMembers');

  static Future<List<HouseTornamentMember>> fetchHouseTornamentMembers(
      String houseTornamentId) async {
    final snap =
        await gethouseTornamentsMemberCollection(houseTornamentId).get();
    List<HouseTornamentMember> list = snap.docs
        .map((e) {
          return HouseTornamentMember.fromJson(
              e.data() as Map<String, dynamic>);
        })
        .whereType<HouseTornamentMember>()
        .toList();
    return list;
  }

  static Future<void> createHouseTornamentMember({
    required String houseTornamentId,
    required HouseTornamentMember houseTornamentMember,
  }) async {
    await gethouseTornamentsMemberCollection(houseTornamentId)
        .doc(houseTornamentMember.uid)
        .set(houseTornamentMember.toJson());
  }

  static Future<void> leaveHouseTornametMember({
    required String houseTornamentId,
    required String houseTornamentMemberId,
  }) async {
    await gethouseTornamentsMemberCollection(houseTornamentId)
        .doc(houseTornamentMemberId)
        .delete();
  }

  static Future<HouseTornamentMember> setHouseTornamentMember({
    required String houseTornamentId,
    required AppUser appUser,
  }) async {
    final houseTornamentMember = HouseTornamentMember(
        uid: appUser.id,
        userName: appUser.userName,
        userId: appUser.userId,
        userImage: appUser.userImage,
        joinedAt: Timestamp.now());
    await gethouseTornamentsMemberCollection(houseTornamentId)
        .doc()
        .set(houseTornamentMember.toJson(), SetOptions(merge: true));
    return houseTornamentMember;
  }

  static Future<int> fetchHouseTornamentMemberDocsCount(
      String houseTornamentId) async {
    final query = await gethouseTornamentsMemberCollection(houseTornamentId)
        .count()
        .get();
    return query.count;
  }

  static leaveHouseTornamentMember(
      {required String houseTornamentId, required String memberId}) {}
}
