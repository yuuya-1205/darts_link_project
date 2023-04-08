import 'package:darts_link_project/models/tournament_match_type.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:darts_link_project/views/components/litst_item_view.dart';
import 'package:darts_link_project/views/darts_function_page/singles_page.dart';
import 'package:flutter/material.dart';

class CreateTournamentPage extends StatefulWidget {
  const CreateTournamentPage({Key? key}) : super(key: key);

  @override
  State<CreateTournamentPage> createState() => _CreateTournamentPageState();
}

class _CreateTournamentPageState extends State<CreateTournamentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('トーナメント機能'),
      ),
      body: Column(
        children: TournamentMatchType.values
            .map(
              (type) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SinglesPage()),
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
