import 'package:algolia/algolia.dart';
import 'package:darts_link_project/models/battle_room.dart';

class AlgoliaRepository {
  final Algolia algolia = const Algolia.init(
    applicationId: 'HRBJUVHHX8',
    apiKey: '45bf79b83ad6d4261bb67540fc8d77b3',
  );

  // Future<List<AppUser>> searchProfiles(String searchQuery) async {
  //   final result =
  //       // ignore: deprecated_member_use
  //       await algolia.instance.index('users').search(searchQuery).getObjects();
  //   return result.hits.map(Profile.fromAlgolia).toList();
  // }

  Future<List<BattleRoom>> searchBattleRooms(String searchQuery) async {
    final result = await algolia.instance
        .index('battleRooms')
        .query(searchQuery)
        .getObjects();
    return result.hits.map(BattleRoom.fromAlgolia).toList();
  }

  // Future<List<Post>> searchPosts(String searchQuery) async {
  //   final result =
  //       await algolia.instance.index('posts').search(searchQuery).getObjects();
  //   return result.hits.map(Post.fromAlgolia).toList();
  // }

  // Future<List<Dartsbar>> searchDartsbars(String searchQuery) async {
  //   final result = await algolia.instance
  //       .index('dartsbars')
  //       .search(searchQuery)
  //       .getObjects();
  //   return result.hits.map(Dartsbar.fromAlgolia).toList();
  // }
}
