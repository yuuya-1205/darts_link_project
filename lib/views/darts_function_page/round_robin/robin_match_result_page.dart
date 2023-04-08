import 'package:darts_link_project/components/robin_text.dart';
import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/models/team.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:darts_link_project/views/components/original_button.dart';
import 'package:flutter/material.dart';

class RobinMatchResultPage extends StatefulWidget {
  const RobinMatchResultPage({
    super.key,
    required this.teams,
    required this.roundRobin,
    required this.round,
  });

  final List<Team> teams;
  final RoundRobin roundRobin;
  final int round;

  @override
  State<RobinMatchResultPage> createState() => _RobinMatchResultPageState();
}

class _RobinMatchResultPageState extends State<RobinMatchResultPage> {
  List<int> winRegValues = List.generate(9, (index) => index);
  late Map<String, int> selectedWinRegs;
  late int isSelectedValue;
  late final firstTeam = widget.teams.first;
  late final secondTeam = widget.teams.last;
  // List<int> winRegs = [1, 2, 3, 4, 5, 6, 7, 8];
  // late int isSelectedValue;

  Map<String, bool> isWin = {};
  bool selectedFirstTeamIsWin = true;

  void initSelectedWinRegs() {
    selectedWinRegs = {
      firstTeam.id: firstTeam.winRegs[secondTeam.id] ?? 0,
      secondTeam.id: secondTeam.winRegs[firstTeam.id] ?? 0,
    };
  }

  @override
  void initState() {
    isSelectedValue = winRegValues.first;
    initSelectedWinRegs();
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
        title: const Text(
          '対戦結果',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const RobinText(
                width: 114,
                text: '試合数',
              ),
              RobinText(
                width: 120,
                text: widget.teams.first.teamName,
              ),
              const RobinText(
                width: 65,
                text: 'VS',
              ),
              RobinText(
                width: 120,
                text: widget.teams.last.teamName,
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RobinTextSecond(
                width: 114,
                text: '第${widget.round}試合',
              ),
              SizedBox(
                width: 120,
                child: DropdownButton(
                  value: selectedFirstTeamIsWin,
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
                    selectedFirstTeamIsWin = value!;
                    setState(() {});
                  },
                ),
              ),
              const RobinTextSecond(
                width: 65,
                text: '',
              ),
              SizedBox(
                width: 120,
                child: DropdownButton(
                  value: !selectedFirstTeamIsWin,
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
                    selectedFirstTeamIsWin = value!;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              RobinText(
                width: 114,
                text: '勝ちReg数',
              ),
              RobinText(
                width: 120,
                text: 'Aチーム',
              ),
              RobinText(
                width: 65,
                text: 'VS',
              ),
              RobinText(
                width: 120,
                text: 'Bチーム',
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RobinTextSecond(
                width: 114,
                text: '第${widget.round}試合',
              ),

              SizedBox(
                width: 120,
                child: DropdownButton(
                  items: winRegValues.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                  value: selectedWinRegs[firstTeam.id],
                  onChanged: (int? value) {
                    setState(() {
                      selectedWinRegs[firstTeam.id] = value!;
                    });
                  },
                ),
              ),
              // RobinText(
              //   width: 120,
              //   text: 'Aチーム',
              // ),
              const RobinTextSecond(
                width: 65,
                text: '',
              ),
              SizedBox(
                width: 120,
                child: DropdownButton(
                  items: winRegValues.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
                  value: selectedWinRegs[secondTeam.id],
                  onChanged: (int? value) {
                    setState(() {
                      selectedWinRegs[secondTeam.id] = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          OriginalButton(
            text: '保存する',
            onPressed: () async {
              await TeamRepository.updateMatchResult(
                roundRobinId: widget.roundRobin.id,
                teamId: firstTeam.id,
                opponentTeamId: secondTeam.id,
                isWin: selectedFirstTeamIsWin,
                winReg: selectedWinRegs[firstTeam.id]!,
              );

              await TeamRepository.updateMatchResult(
                roundRobinId: widget.roundRobin.id,
                teamId: secondTeam.id,
                opponentTeamId: firstTeam.id,
                isWin: !selectedFirstTeamIsWin,
                winReg: selectedWinRegs[secondTeam.id]!,
              );

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
