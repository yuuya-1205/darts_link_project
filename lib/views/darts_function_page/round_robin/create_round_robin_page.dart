// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/round_robin.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/round_robin_repoisitory.dart';
import 'package:darts_link_project/repositories/team_repository.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/round_robin_page.dart';
import 'package:flutter/material.dart';

class CreateRoundRobinPage extends StatefulWidget {
  const CreateRoundRobinPage({Key? key}) : super(key: key);

  @override
  State<CreateRoundRobinPage> createState() => _CreateRoundRobinPageState();
}

class _CreateRoundRobinPageState extends State<CreateRoundRobinPage> {
  final user = AuthRepository.currentUser;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  List<TeamNameWriteBox> teamNameWriteBoxes = [
    TeamNameWriteBox(
      controller: TextEditingController(text: 'チームA'),
    ),
  ];

  void _writeBoxCounter() {
    setState(() {
      teamNameWriteBoxes.add(
        TeamNameWriteBox(
            controller: TextEditingController(
                text: 'チーム${alphabetList[teamNameWriteBoxes.length]}')),
      );
    });
  }

  void _writeBoxDecrementCounter() {
    setState(() {
      teamNameWriteBoxes.removeLast();
    });
  }

  final alphabetList = List.generate(
    26,
    (int index) => String.fromCharCode(
      index + 'A'.codeUnits[0],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(44, 14, 28, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: const [
            SizedBox(
              width: 30,
              child: BackButton(),
            ),
            Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'ラウンドロビン作成',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('タイトル'),
                    Flexible(
                      child: InputField(
                        controller: _titleController,
                        hintText: '入力してください',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '場所を入力してください';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                ...teamNameWriteBoxes,
                OriginalButton(
                  primary: Colors.white,
                  onPrimary: const Color.fromRGBO(247, 63, 150, 1),
                  text: '追加する',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {
                    _writeBoxCounter();
                  },
                ),
                OriginalButton(
                  primary: Colors.white,
                  onPrimary: const Color.fromRGBO(247, 63, 150, 1),
                  text: '削除する',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {
                    _writeBoxDecrementCounter();
                  },
                ),
                OriginalButton(
                  primary: const Color.fromRGBO(247, 63, 150, 1),
                  onPrimary: Colors.white,
                  text: '作成する',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () async {
                    final roundRobin = RoundRobin(
                      title: _titleController.text,
                      creatorRef: AppUserRepository.getAppUserDocRef(user!),
                      createrName: user!.userName,
                      userId: user!.userId,
                      teamCounts: teamNameWriteBoxes.length,
                      createdAt: Timestamp.now(),
                      updatedAt: Timestamp.now(),
                    );
                    final roundRobinId =
                        await RoundRobinRepository.addRoundRobin(roundRobin);
                    await Future.forEach(
                        teamNameWriteBoxes,
                        (element) => TeamRepository.createTeam(
                            roundRobinId: roundRobinId,
                            teamName: element.controller.text));

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => RoundRobinPage(
                              roundRobin: roundRobin.copyWith(id: roundRobinId),
                            )),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamNameWriteBox extends StatelessWidget {
  const TeamNameWriteBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('チーム名'),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(),
              hintText: '入力してください',
            ),
          ),
        )
      ],
    );
  }
}
