import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:flutter/material.dart';

class RoundRobinWinLoseListPage extends StatefulWidget {
  const RoundRobinWinLoseListPage({
    super.key,
    required this.roundRobin,
  });

  final RoundRobin roundRobin;

  @override
  State<RoundRobinWinLoseListPage> createState() =>
      _RoundRobinWinLoseListPageState();
}

class _RoundRobinWinLoseListPageState extends State<RoundRobinWinLoseListPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Team>>(
        stream: TeamRepository.teamStream(roundRobinId: widget.roundRobin.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const SizedBox();
          }
          final teams = snapshot.data;
          if (teams!.isEmpty) {
            return const Center(
              child: Text('まだ、投稿がありません'),
            );
          }

          //todo コードをわかりやすくリファクタリングしたい
          final crossAxisCount = teams.length + 1;
          return GridView.count(
            crossAxisCount: crossAxisCount,
            children: List.generate(crossAxisCount * crossAxisCount, (index) {
              if (index % (teams.length + 2) == 0) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color(0xffFFDCEC),
                  ),
                );
              }
              if (index <= teams.length) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Text(teams[index - 1].teamName),
                );
              }
              if (index % crossAxisCount == 0) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Text(teams[(index ~/ crossAxisCount) - 1].teamName),
                );
              }

              final isWin = teams[(index ~/ crossAxisCount) - 1]
                  .isWin[teams[(index % crossAxisCount) - 1].id];
              return Container(
                padding: const EdgeInsets.all(5.0),
                width: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: isWin == null
                    ? const SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isWin ? Icons.circle_outlined : Icons.close,
                            color: const Color(0xffD2307D),
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                              color: Color(0xffD2307D),
                              fontWeight: FontWeight.bold,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${teams[(index ~/ crossAxisCount) - 1].winRegs[teams[(index % crossAxisCount) - 1].id]}'),
                                const Text('-'),
                                Text(
                                    '${teams[(index % crossAxisCount) - 1].winRegs[teams[(index ~/ crossAxisCount) - 1].id]}'),
                              ],
                            ),
                          ),
                        ],
                      ),
              );
            }),
          );
        });
  }
}
