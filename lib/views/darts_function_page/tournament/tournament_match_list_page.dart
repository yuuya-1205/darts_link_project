import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:flutter/material.dart';

class TournamentMatchListPage extends StatefulWidget {
  const TournamentMatchListPage({super.key});

  @override
  State<TournamentMatchListPage> createState() =>
      _TournamentMatchListPageState();
}

class _TournamentMatchListPageState extends State<TournamentMatchListPage> {
  @override
  void initState() {
    createMatch();
    super.initState();
  }

  List<Team> teams = [
    Team(
      id: 'a',
      teamName: 'A',
      updatedAt: Timestamp.now(),
      createdAt: Timestamp.now(),
    ),
    Team(
      id: 'b',
      teamName: 'B',
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    )
  ];

  List<List<Team>> matchs = [];

  Future<void> createMatch() async {
    teams.asMap().forEach(
      (key, value) {
        for (int i = key; i < teams.length - 1; i++) {
          matchs.add(
            [value, teams[i + 1]],
          );
        }
      },
    );
    matchs.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: matchs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 34,
              width: double.infinity,
              color: const Color.fromRGBO(255, 129, 189, 1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 5),
                child: Text(
                  '第${index + 1}試合',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: ((context) => RobinMatchResultPage(
                //           roundRobin: widget.roundRobin,
                //           teams: matchs[index],
                //           round: index + 1,
                //         )),
                //   ),
                // );
              },
              child: Container(
                height: 67,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      matchs[index].first.teamName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'VS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      matchs[index].last.teamName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
