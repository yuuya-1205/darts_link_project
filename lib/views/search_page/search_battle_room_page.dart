import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/views/battle_room_page/components/battle_room_card.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:flutter/material.dart';

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

    return ListView.builder(
      itemCount: _battleRooms.length,
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.only(top: index == 0 ? 16 : 0, bottom: 16),
        child: BattleRoomCard(battleRoom: _battleRooms[index]),
      ),
    );
  }
}
