import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/app_user.dart';

class PersonRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final personCollection = fireStore.collection('persons');
  static DocumentReference getDocumentRef(String uid) =>
      personCollection.doc(uid);

  static Future<void> updatePerson(Person person) async {
    await personCollection
        .doc(person.id)
        .set(person.toJson(), SetOptions(merge: true));
  }

  static Future<Person?> fetchPerson(String uid) async {
    final snap = await getDocumentRef(uid).get();
    if (!snap.exists) {
      return null;
    }

    final person = Person.fromJson(snap.data() as Map<String, dynamic>)
        .copyWith(reference: snap.reference);

    return person;
  }

  static Future<List<Person>> fetchSearchedPersons(String value) async {
    final result = await Future.wait(
      [
        fetchPersonsByUserName(value),
        fetchPersonsByUserId(value),
        fetchPersonsBySelfIntroduction(value),
      ],
    );

    /// toSetで重複するデータを排除し、更新日順で並び替え
    final persons = result.expand((e) => e).toList().toSet().toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return persons;
  }

  static Future<List<Person>> fetchPersonsByUserName(String value) async {
    final snapshot = await personCollection
        .orderBy('userName')
        .startAt([value]).endAt(['$value\uf8ff']).get();
    final persons = snapshot.docs
        .map((e) => Person.fromJson(e.data()).copyWith(reference: e.reference))
        .toList();
    return persons;
  }

  static Future<List<Person>> fetchPersonsByUserId(String value) async {
    final snapshot = await personCollection
        .orderBy('userId')
        .startAt([value]).endAt(['$value\uf8ff']).get();
    final persons = snapshot.docs
        .map((e) => Person.fromJson(e.data()).copyWith(reference: e.reference))
        .toList();
    return persons;
  }

  static Future<List<Person>> fetchPersonsBySelfIntroduction(
      String value) async {
    final snapshot = await personCollection
        .orderBy('selfIntroduction')
        .startAt([value]).endAt(['$value\uf8ff']).get();
    final persons = snapshot.docs
        .map((e) => Person.fromJson(e.data()).copyWith(reference: e.reference))
        .toList();
    return persons;
  }
}
