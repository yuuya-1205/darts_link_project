import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';

class HouseTournamentRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final houseTournamentsCollection =
      fireStore.collection('houseTournaments');
  static DocumentReference getDocumentRef(String houseTournamentId) =>
      houseTournamentsCollection.doc(houseTournamentId);

  static Future<String> createHouseTournament(
      HouseTournament houseTournament) async {
    final room = await houseTournamentsCollection.add(houseTournament.toJson());
    return room.id;
  }

  static Stream<List<HouseTournament>> houseTournamentStream() {
    return houseTournamentsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => HouseTournament.fromJson(doc.data())
                .copyWith(houseTournamentId: doc.id))
            .toList());
  }

  static Future<void> updateHouseTournament(
      HouseTournament houseTournament) async {
    await houseTournamentsCollection
        .doc(houseTournament.houseTournamentId)
        .set(houseTournament.toJson(), SetOptions(merge: true));
  }

  static Future<void> deleteHouseTournament(
      HouseTournament houseTournament) async {
    await houseTournamentsCollection
        .doc(houseTournament.houseTournamentId)
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

  static Future<List<HouseTournament>> fetchSearchedHouseTournaments(
      String value) async {
    final result = await Future.wait([
      fetchHouseTournamentsByTitle(value),
      fetchHouseTournamentsByDetail(value)
    ]);

    /// toSetで重複するデータを排除し、更新日順で並び替え
    final houseTournaments = result
        .expand((element) => element)
        .toSet()
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return houseTournaments;
  }

  static Future<List<HouseTournament>> fetchHouseTournamentsByTitle(
      String value) async {
    final snapshot = await houseTournamentsCollection
        .orderBy('title')
        .startAt([value]).endAt(['$value\uf8ff']).get();

    return snapshot.docs
        .map((e) => HouseTournament.fromJson(e.data())
            .copyWith(houseTournamentId: e.id))
        .toList();
  }

  static Future<List<HouseTournament>> fetchHouseTournamentsByDetail(
      String value) async {
    final snapshot = await houseTournamentsCollection
        .orderBy('detail')
        .startAt([value]).endAt(['$value\uf8ff']).get();

    return snapshot.docs
        .map((e) => HouseTournament.fromJson(e.data())
            .copyWith(houseTournamentId: e.id))
        .toList();
  }

  static Future<List<HouseTournament>> fetchHouseTournamentsByOwner(
      DocumentReference ownerRef) async {
    final snapshot = await houseTournamentsCollection
        .where('ownerReference', isEqualTo: ownerRef)
        .orderBy('createdAt')
        .get();

    return snapshot.docs
        .map((e) => HouseTournament.fromJson(e.data())
            .copyWith(houseTournamentId: e.id))
        .toList();
  }
}
