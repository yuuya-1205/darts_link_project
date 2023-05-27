import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/views/components/house_tournament/house_touenament_list_item_view.dart';
import 'package:flutter/material.dart';

class HouseTournamentListView extends StatelessWidget {
  const HouseTournamentListView({required this.houseTournaments, Key? key})
      : super(key: key);
  final List<HouseTournament> houseTournaments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: houseTournaments.length,
      separatorBuilder: (_, __) => const Divider(height: 0, thickness: 1),
      itemBuilder: (context, index) =>
          HouseTournamentListItemView(houseTournament: houseTournaments[index]),
    );
  }
}
