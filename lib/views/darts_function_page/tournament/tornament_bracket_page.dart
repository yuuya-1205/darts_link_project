import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/models/tournament.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:darts_link_project/utils/const.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:flutter/material.dart';

class TournamentBracketPage extends StatefulWidget {
  const TournamentBracketPage({Key? key, required this.tournament})
      : super(key: key);
  final Tournament tournament;

  @override
  State<TournamentBracketPage> createState() => _TournamentBracketPageState();
}

class _TournamentBracketPageState extends State<TournamentBracketPage> {
  List<List<Team?>> tournaments = [];
  String cacheName = '';

  Future<void> fetchTeams() async {
    final teams = (await TeamRepository.fetchTeams(
        tournamentId: widget.tournament.reference?.id))
      ..shuffle();
    tournaments = [teams];
    tournaments.add(List.generate(teams.length ~/ 2, (index) => null));
    if (teams.length % 2 == 1) {
      tournaments[1].insert(0, teams.first);
    }

    setState(() {});
  }

  void setResult(Team team) {
    print(tournaments);
    for (final entry in tournaments.asMap().entries) {
      print(entry.value);
      if (entry.value.length % 2 == 0 &&
          entry.value.where((e) => e?.id == team.id).isNotEmpty) {
        final index =
            entry.value.indexWhere((element) => element?.id == team.id);
        if (tournaments[entry.key + 1].isEmpty) {
          continue;
        }
        tournaments[entry.key + 1][index ~/ 2] = team;
      }
    }
    // tournaments.add([team]);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      await fetchTeams();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tournaments.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      key: GlobalKey(debugLabel: '${tournaments.length}'),
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('トーナメント表'),
      ),
      // body: Bracket.TournamentBracket<Team?>(
      //   hadderBuilder: (context, index, count) {
      //     print(count);
      //     if (tournaments.length < count) {
      //       tournaments.add([]);
      //     }
      //     print(tournaments);
      //     return Text("第${index + 1}試合");
      //   },
      //   containt: tournaments.map((e) => e.whereType<Team>().toList()).toList(),
      //   onSameTeam: (team1, team2) => team1 == team2,
      //   teamNameBuilder: (Team? t) {
      //     return Container();

      //     //  BracketText(
      //     //   text: t?.teamName ?? 'null',
      //     //   textStyle: const TextStyle(
      //     //       color: Colors.black, fontWeight: FontWeight.bold),
      //     // );
      //   },
      //   winnerConnectorColor: Colors.red,
      //   teamContainerDecoration:

      //   BracketBoxDecroction(color: Colors.grey),
      //   onLineIconPress: ((team1, team2, tapDownDetails) async {
      //     print(tapDownDetails.globalPosition);
      //     print(tapDownDetails.localPosition);
      //     if (team1 == null || team2 == null) {
      //       return;
      //     }
      //     await showDialog(
      //         context: context,
      //         builder: (context) {
      //           final teams = [team1, team2];
      //           final Map<String, int> selectedWinRegs = {
      //             team1.id: 0,
      //             team2.id: 0,
      //           };
      //           String winnerId = team1.id;
      //           return StatefulBuilder(builder: (context, rebuild) {
      //             return SimpleDialog(
      //               title: const Text('対戦結果登録'),
      //               contentPadding: const EdgeInsets.all(24),
      //               children: [
      //                 const Text(
      //                   '勝ちReg数',
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //                 _WinRegSelector(
      //                   teams: teams,
      //                   selectedWinRegs: selectedWinRegs,
      //                   onChanged: (id, value) {
      //                     rebuild(() {
      //                       selectedWinRegs[id] = value;
      //                       winnerId = selectedWinRegs[team1.id]! >
      //                               selectedWinRegs[team2.id]!
      //                           ? team1.id
      //                           : team2.id;
      //                     });
      //                   },
      //                 ),
      //                 const SizedBox(height: 12),
      //                 const Text(
      //                   '勝敗結果',
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //                 _WinLoseSelector(
      //                   teams: teams,
      //                   winnerId: winnerId,
      //                   onChanged: (id, isWin) {
      //                     rebuild(() {
      //                       if (isWin) {
      //                         winnerId = id;
      //                       } else {
      //                         winnerId = team1.id == id ? team2.id : team1.id;
      //                       }
      //                     });
      //                   },
      //                 ),
      //                 const SizedBox(height: 24),
      //                 ElevatedButton(
      //                   onPressed: () async {
      //                     final navigator = Navigator.of(context);
      //                     await Future.wait(
      //                       teams
      //                           .map(
      //                             (team) => TeamRepository.updateMatchResult(
      //                               tournamentId:
      //                                   widget.tournament.reference?.id,
      //                               teamId: team.id,
      //                               opponentTeamId: teams
      //                                   .firstWhere(
      //                                       (element) => element.id != team.id)
      //                                   .id,
      //                               isWin: team.id == winnerId,
      //                               winReg: selectedWinRegs[team.id] ?? 0,
      //                             ),
      //                           )
      //                           .toList(),
      //                     );
      //                     setResult(teams
      //                         .firstWhere((element) => element.id == winnerId));
      //                     navigator.pop();
      //                     // await fetchTeams();
      //                   },
      //                   child: const Text('登録'),
      //                 )
      //               ],
      //             );
      //           });
      //         });
      //   }),
      //   context: context,
      // ),
    );
  }
}

class _WinLoseSelector extends StatelessWidget {
  const _WinLoseSelector({
    Key? key,
    required this.teams,
    required this.winnerId,
    required this.onChanged,
  }) : super(key: key);

  final List<Team> teams;
  final String winnerId;
  final void Function(String, bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: teams.map((team) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(team.teamName),
            DropdownButton(
              value: team.id == winnerId,
              items: const [
                DropdownMenuItem(
                  value: true,
                  child: Text('勝ち'),
                ),
                DropdownMenuItem(
                  value: false,
                  child: Text('負け'),
                )
              ],
              onChanged: (value) {
                onChanged(team.id, value!);
              },
            )
          ],
        );
      }).toList(),
    );
  }
}

class _WinRegSelector extends StatelessWidget {
  const _WinRegSelector({
    Key? key,
    required this.teams,
    required this.selectedWinRegs,
    required this.onChanged,
  }) : super(key: key);
  final List<Team> teams;
  final Map<String, int> selectedWinRegs;
  final void Function(String, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: teams.map((team) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${team.teamName}；'),
            DropdownButton(
              items: winRegValues.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value'),
                );
              }).toList(),
              value: selectedWinRegs[team.id],
              onChanged: (int? value) {
                onChanged(team.id, value!);
              },
            ),
          ],
        );
      }).toList(),
    );
  }
}
