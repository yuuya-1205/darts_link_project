import 'package:darts_link_project/models/tournament.dart';
import 'package:darts_link_project/models/tournament_tab_type.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key, required this.tournament}) : super(key: key);

  final Tournament tournament;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: Text(widget.tournament.title),
      ),
      body: DefaultTabController(
        length: TournamentTabType.values.length,
        child: Column(
          children: [
            TabBar(
                indicatorColor: OriginalTheme.themeData.primaryColor,
                labelColor: OriginalTheme.themeData.primaryColor,
                unselectedLabelColor: OriginalTheme.themeData.disabledColor,
                labelStyle: const TextStyle(fontSize: 12),
                tabs: TournamentTabType.values
                    .map((type) => Tab(
                          text: type.title,
                        ))
                    .toList()),
            Expanded(
              child: TabBarView(
                children: TournamentTabType.values
                    .map((type) => type.navigatePage(widget.tournament))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
