import 'package:darts_link_project/components/robin_text.dart';
import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:flutter/material.dart';

import 'round_robin_card.dart';

class RoundRobinRankListPage extends StatefulWidget {
  const RoundRobinRankListPage({super.key, required this.roundRobin});

  final RoundRobin roundRobin;

  @override
  State<RoundRobinRankListPage> createState() => _RoundRobinRankListPageState();
}

class _RoundRobinRankListPageState extends State<RoundRobinRankListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            RobinText(
              width: 114,
              text: '順位',
            ),
            RobinText(
              width: 170,
              text: 'チーム',
            ),
            RobinText(
              width: 65,
              text: '勝ち数',
            ),
            RobinText(
              width: 65,
              text: '負け数',
            ),
          ],
        ),
        Row(
          children: [],
        ),
        StreamBuilder<List<Team>>(
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
            teams.forEach((element) {});

            teams.sort(
              (a, b) => b.totalWinCount.compareTo(a.totalWinCount),
            );

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];
                    return RoundRobinCard(
                      team: team,
                      teamCount: index + 1,
                    );
                  }),
            );
          },
        ),
      ],
    );
  }
}
