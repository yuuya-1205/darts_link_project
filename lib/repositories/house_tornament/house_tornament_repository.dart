import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament.dart';

class HouseTournamentRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final houseTournamentsCollection =
      fireStore.collection('houseTournaments');
  static DocumentReference getDocumentRef(String houseTournamentId) =>
      houseTournamentsCollection.doc(houseTournamentId);

  static Future<String> createHouseTournament(
      HouseTornament houseTournament) async {
    final room = await houseTournamentsCollection.add(houseTournament.toJson());
    return room.id;
  }

  static Stream<List<HouseTornament>> houseTournamentStream() {
    return houseTournamentsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => HouseTornament.fromJson(doc.data())
                .copyWith(houseTornamentId: doc.id))
            .toList());
  }

  static Future<void> updateHouseTournament(
      HouseTornament houseTournament) async {
    await houseTournamentsCollection
        .doc(houseTournament.houseTornamentId)
        .set(houseTournament.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteHouseTournament(
      HouseTornament houseTournament) async {
    await houseTournamentsCollection
        .doc(houseTournament.houseTornamentId)
        .delete();
  }

  static Future<bool> canCreateHouseTournamentMember(
      String houseTournamentId) async {
    final snapshot =
        await houseTournamentsCollection.doc(houseTournamentId).get();
    final data = snapshot.data() as Map<String, dynamic>;
    int capacity = data['capacity'];
    int numberOfParticipants = data['numberOfParticipants'];
    if (capacity <= numberOfParticipants) {
      return false;
    }
    return true;
  }
}
