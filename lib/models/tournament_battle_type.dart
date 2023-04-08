import 'package:darts_link_project/views/darts_function_page/round_robin/create_round_robin_page.dart';
import 'package:darts_link_project/views/darts_function_page/tournament/create_tournament_battle_page.dart';
import 'package:flutter/material.dart';

enum TournamentBattleType {
  tournament('トーナメント戦', CreateTournamentBattlePage()),
  roundRobin('総当たり戦', CreateRoundRobinPage());

  const TournamentBattleType(this.title, this.navigatePage);
  final String title;
  final Widget navigatePage;
}
