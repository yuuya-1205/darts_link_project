import 'package:darts_link_project/views/darts_function_page/tournament/tornament_bracket_page.dart';
import 'package:darts_link_project/views/darts_function_page/tournament/tournament_match_list_page.dart';
import 'package:flutter/material.dart';

enum TournamentTabType {
  matchList('試合一覧'),
  tournamentBracket('トーナメント表');

  const TournamentTabType(this.title);
  final String title;

  Widget navigatePage() {
    switch (this) {
      case TournamentTabType.matchList:
        return const TournamentMatchListPage();
      case TournamentTabType.tournamentBracket:
        return const TournamentBracketPage();
    }
  }
}
