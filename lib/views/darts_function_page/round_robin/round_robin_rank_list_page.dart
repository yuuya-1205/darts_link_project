import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:flutter/material.dart';

class RoundRobinRankListPage extends StatefulWidget {
  const RoundRobinRankListPage({super.key, required this.roundRobin});

  final RoundRobin roundRobin;

  @override
  State<RoundRobinRankListPage> createState() => _RoundRobinRankListPageState();
}

class _RoundRobinRankListPageState extends State<RoundRobinRankListPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Team>>(
        stream: TeamRepository.teamStream(roundRobinId: widget.roundRobin.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          final teams = snapshot.data;
          if (teams!.isEmpty) {
            return const Center(
              child: Text('まだ、投稿がありません'),
            );
          }

          return GridView.count(
            //ここにチーム数を表示する teams.lenght
            // １列に表示するアイテムの数を指定
            crossAxisCount: teams.length,
            // スクロールする向きを指定
            scrollDirection: Axis.vertical,
            // 200個アイテムを生成
            //チーム数＊チーム数でやる。
            children: List.generate(teams.length * teams.length, (index) {
              return Container(
                padding: const EdgeInsets.all(5.0),
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: const Text("Containerの角丸枠線"),
                ),
              );
            }),
          );
        });
  }
}
