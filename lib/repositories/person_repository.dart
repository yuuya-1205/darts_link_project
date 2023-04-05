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

  static Future<List<Person>> fetchPersonsByUserName(String userName) async {
    final snapshot = await personCollection
        .orderBy('userName')
        .startAt([userName]).endAt(['$userName\uf8ff']).get();
    final persons = snapshot.docs
        .map((e) => Person.fromJson(e.data()).copyWith(reference: e.reference))
        .toList();
    return persons;
  }
}
