import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/round_robin.dart';

class RoundRobinRepository {
  static final fireStore = FirebaseFirestore.instance;
  static final roundRobinsCollection = fireStore.collection('roundRobins');

  static Future<String> addRoundRobin(RoundRobin roundRobin) async {
    final map = roundRobin.toJson();
    map.remove('id');
    final doc = await roundRobinsCollection.add(map);
    return doc.id;
  }
}
