import 'package:darts_link_project/models/tournament_battle_type.dart';
import 'package:darts_link_project/views/components/litst_item_view.dart';
import 'package:flutter/material.dart';

import '../components/app_bar_back_view.dart';

class SinglesPage extends StatefulWidget {
  const SinglesPage({Key? key}) : super(key: key);

  @override
  State<SinglesPage> createState() => _SinglesPageState();
}

class _SinglesPageState extends State<SinglesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('シングルス'),
      ),
      body: Column(
        children: TournamentBattleType.values
            .map(
              (type) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => type.navigatePage),
                    ),
                  );
                },
                child: ListItemView(text: type.title),
              ),
            )
            .toList(),
      ),
    );
  }
}
