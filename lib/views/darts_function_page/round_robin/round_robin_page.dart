import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/round_robin_match_list_page.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/round_robin_rank_list_page.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/round_robin_win_lose_list_page.dart';
import 'package:flutter/material.dart';

class RoundRobinPage extends StatefulWidget {
  const RoundRobinPage({Key? key, required this.roundRobin}) : super(key: key);

  final RoundRobin roundRobin;

  @override
  State<RoundRobinPage> createState() => _RoundRobinPageState();
}

class _RoundRobinPageState extends State<RoundRobinPage> {
  late Map<String, Widget> tabPageMaps;
  @override
  void initState() {
    tabPageMaps = {
      '試合一覧': RoundRobinMatchListPage(
        roundRobin: widget.roundRobin,
      ),
      '勝敗表': RoundRobinWinLoseListPage(
        roundRobin: widget.roundRobin,
      ),
      '順位表': RoundRobinRankListPage(
        roundRobin: widget.roundRobin,
      ),
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
            ),
            const Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.roundRobin.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DefaultTabController(
        length: tabPageMaps.length,
        child: Column(
          children: [
            TabBar(
                indicatorColor: OriginalTheme.themeData.primaryColor,
                labelColor: OriginalTheme.themeData.primaryColor,
                unselectedLabelColor: OriginalTheme.themeData.disabledColor,
                labelStyle: const TextStyle(fontSize: 12),
                tabs: tabPageMaps.keys
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList()),
            Expanded(
              child: TabBarView(children: tabPageMaps.values.toList()),
            ),
          ],
        ),
      ),
    );
  }
}
