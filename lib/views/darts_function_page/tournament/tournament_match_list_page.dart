import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/models/tournament.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:flutter/material.dart';

class TournamentMatchListPage extends StatefulWidget {
  const TournamentMatchListPage({super.key, required this.tournament});
  final Tournament tournament;

  @override
  State<TournamentMatchListPage> createState() =>
      _TournamentMatchListPageState();
}

class _TournamentMatchListPageState extends State<TournamentMatchListPage> {
  List<Team> teams = [];
  List<List<List<Team>>> matches = [];

  @override
  void initState() {
    createMatch();
    super.initState();
  }

  Future<void> fetchTeams() async {
    teams = await TeamRepository.fetchTeams(
        tournamentId: widget.tournament.reference?.id);
  }

  Future<void> createMatch() async {
    await fetchTeams();
    teams.asMap().forEach(
      (key, value) {
        for (int i = key; i < teams.length - 1; i++) {
          matches.add(
            [
              [value, teams[i + 1]]
            ],
          );
        }
      },
    );
    matches.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: matches.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              height: 34,
              width: double.infinity,
              color: const Color.fromRGBO(255, 129, 189, 1),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 5),
                child: Text(
                  '第${i + 1}試合',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: matches[i].length,
              itemBuilder: (_, j) => GestureDetector(
                onTap: () {},
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
                        matches[i][j].first.teamName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'VS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        matches[i][j].last.teamName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
