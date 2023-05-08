import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/round_robin_repoisitory.dart';
import 'package:darts_link_project/repositories/tournament_repository.dart';

class TeamRepository {
  static final fireStore = FirebaseFirestore.instance;
  static CollectionReference getRoundRobinTeamsCollection(
          String roundRobinId) =>
      RoundRobinRepository.roundRobinsCollection
          .doc(roundRobinId)
          .collection('teams');
  static CollectionReference getTournamentTeamsCollection(
          String tournamentId) =>
      TournamentRepository.collection.doc(tournamentId).collection('teams');

  static Future<void> createTeam({
    String? roundRobinId,
    String? tournamentId,
    required String teamName,
  }) async {
    if (roundRobinId != null) {
      getRoundRobinTeamsCollection(roundRobinId).add({
        'teamName': teamName,
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
      });
      return;
    }
    if (tournamentId != null) {
      getTournamentTeamsCollection(tournamentId).add({
        'teamName': teamName,
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
      });
      return;
    }
  }

  static Future<void> updateTeam({
    required String roundRobinId,
    required Team team,
  }) async {
    await getRoundRobinTeamsCollection(roundRobinId).doc(team.id).update(
          team.toJson(),
        );
  }

  static Future<void> updateMatchResult({
    String? roundRobinId,
    String? tournamentId,
    required String teamId,
    required String opponentTeamId,
    required bool isWin,
    required int winReg,
  }) async {
    late final CollectionReference colRef;
    if (roundRobinId != null) {
      colRef = getRoundRobinTeamsCollection(roundRobinId);
    } else {
      colRef = getTournamentTeamsCollection(tournamentId!);
    }
    await colRef.doc(teamId).update({
      'updatedAt': Timestamp.now(),
      'isWin.$opponentTeamId': isWin,
      'winRegs.$opponentTeamId': winReg,
    });
  }

  static Future<List<Team>> fetchTeams({
    String? roundRobinId,
    String? tournamentId,
  }) async {
    late final QuerySnapshot snap;
    if (roundRobinId != null) {
      snap = await getRoundRobinTeamsCollection(roundRobinId)
          .orderBy('teamName')
          .get();
    } else {
      snap = await getTournamentTeamsCollection(tournamentId!)
          .orderBy('teamName')
          .get();
    }
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
    return getRoundRobinTeamsCollection(roundRobinId)
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
