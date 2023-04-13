import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:flutter/material.dart';

import '../components/battle_room/battle_room_list_view.dart';

class SearchBattleRoomPage extends StatefulWidget {
  const SearchBattleRoomPage({required this.searchWord, Key? key})
      : super(key: key);
  final String searchWord;

  @override
  State<SearchBattleRoomPage> createState() => _SearchBattleRoomPageState();
}

class _SearchBattleRoomPageState extends State<SearchBattleRoomPage> {
  List<BattleRoom> _battleRooms = [];
  bool isLoading = true;

  void setLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result = await BattleRoomRepository.fetchSearchedBattleRooms(
          widget.searchWord);
      setState(() {
        _battleRooms = result;
        setLoading(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchWord.isEmpty) {
      return const Center(child: Text('検索キーワードを入力してください。'));
    }
    if (isLoading) {
      return const LoadingView();
    }
    if (_battleRooms.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return BattleRoomListView(battleRooms: _battleRooms);
  }
}
