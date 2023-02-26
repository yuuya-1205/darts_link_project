import 'package:darts_link_project/views/darts_function_page/darts_function_page.dart';
import 'package:darts_link_project/views/darts_function_page/round_robin/create_round_robin_page.dart';
import 'package:darts_link_project/views/darts_function_page/tornament_battle_page.dart';
import 'package:flutter/material.dart';

class SinglesPage extends StatefulWidget {
  const SinglesPage({Key? key}) : super(key: key);

  @override
  State<SinglesPage> createState() => _SinglesPageState();
}

class _SinglesPageState extends State<SinglesPage> {
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
          'シングルス',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const TornamentBattlePage()),
              ),
            );
          },
          child: const OriginalContainer(
            text: 'トーナメント戦',
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const CreateRoundRobinPage()),
                ),
              );
            },
            child: const OriginalContainer(
              text: '総当たり戦',
            )),
      ]),
    );
  }
}
