import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/round_robin_repoisitory.dart';

class TeamRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getTeamsCollection(String roundRobinId) =>
      RoundRobinRepository.roundRobinsCollection
          .doc(roundRobinId)
          .collection('teams');

  static Future<void> createTeam({
    required String roundRobinId,
    required String teamName,
  }) async {
    getTeamsCollection(roundRobinId).add({
      'teamName': teamName,
      'createdAt': Timestamp.now(),
      'updatedAt': Timestamp.now(),
    });
  }

  static Future<void> updateTeam({
    required String roundRobinId,
    required Team team,
  }) async {
    await getTeamsCollection(roundRobinId).doc(team.id).update(
          team.toJson(),
        );
  }

  static Future<void> updateMatchResult({
    required String roundRobinId,
    required String teamId,
    required String opponentTeamId,
    required bool isWin,
    required int winReg,
  }) async {
    await getTeamsCollection(roundRobinId).doc(teamId).update({
      'updatedAt': Timestamp.now(),
      'isWin.$opponentTeamId': isWin,
      'winRegs.$opponentTeamId': winReg,
    });
  }

  static Future<List<Team>> fetchTeams({
    required String roundRobinId,
  }) async {
    final snap =
        await getTeamsCollection(roundRobinId).orderBy('teamName').get();
    List<Team> list = snap.docs
        .map((e) {
          final data = e.data() as Map<String, dynamic>;
          data.addAll({
            'id': e.id,
          });
          return Team.fromJson(data);
        })
        .whereType<Team>()
        .toList();
    return list;
  }

  static Stream<List<Team>> teamStream({required String roundRobinId}) {
    return getTeamsCollection(roundRobinId)
        .orderBy('teamName')
        .snapshots()
        .map((snap) => snap.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              data.addAll({
                'id': doc.id,
              });
              final team = Team.fromJson(data);

              return team;
            }).toList());
  }
}
