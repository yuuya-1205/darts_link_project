import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/tournament.dart';

class TournamentRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final collection = fireStore.collection('tournaments');
  static DocumentReference getTournamentDocument(String tournamentId) =>
      collection.doc(tournamentId);

  static Future<String> addTournament(Tournament tournament) async {
    final map = tournament.toJson();
    map.remove('reference');
    final doc = await collection.add(map);
    return doc.id;
  }
}
