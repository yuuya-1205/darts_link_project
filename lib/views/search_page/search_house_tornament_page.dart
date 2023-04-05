import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/views/components/house_tournament/house_tournament_list_view.dart';
import 'package:flutter/material.dart';

class SearchHouseTournamentPage extends StatefulWidget {
  const SearchHouseTournamentPage({required this.searchWord, Key? key})
      : super(key: key);
  final String searchWord;

  @override
  State<SearchHouseTournamentPage> createState() =>
      _SearchHouseTournamentPageState();
}

class _SearchHouseTournamentPageState extends State<SearchHouseTournamentPage> {
  List<HouseTournament> _houseTournaments = [];

  @override
  void initState() {
    super.initState();
    Future(() async {
      final result =
          await HouseTournamentRepository.fetchHouseTournamentsByTitle(
        widget.searchWord,
      );
      setState(() {
        _houseTournaments = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchWord.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return HouseTournamentListView(houseTournaments: _houseTournaments);
  }
}
