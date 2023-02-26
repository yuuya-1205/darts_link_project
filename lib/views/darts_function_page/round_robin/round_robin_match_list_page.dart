import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/robin_match_result_page.dart';
import 'package:flutter/material.dart';

class RoundRobinMatchListPage extends StatefulWidget {
  const RoundRobinMatchListPage({super.key, required this.roundRobin});

  final RoundRobin roundRobin;

  @override
  State<RoundRobinMatchListPage> createState() =>
      _RoundRobinMatchListPageState();
}

class _RoundRobinMatchListPageState extends State<RoundRobinMatchListPage> {
  @override
  void initState() {
    createMatch();
    super.initState();
  }

  List<Team> teams = [];
  Future<void> fetchTeams() async {
    teams = await TeamRepository.fetchTeams(roundRobinId: widget.roundRobin.id);
  }

  List<List<Team>> matchs = [];

  Future<void> createMatch() async {
    await fetchTeams();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => RobinMatchResultPage(
                          roundRobin: widget.roundRobin,
                          teams: matchs[index],
                          round: index + 1,
                        )),
                  ),
                );
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

      //  Text(matchs.length.toString()),

      // Container(
      //   height: 67,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.grey),
      //   ),
      //   child: const Padding(
      //     padding: EdgeInsets.fromLTRB(12, 5, 0, 5),
      //   ),
      // ),
    );
  }
}
