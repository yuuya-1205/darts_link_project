import 'package:flutter/material.dart';

class BattleRoomMemberListPage extends StatefulWidget {
  const BattleRoomMemberListPage({Key? key}) : super(key: key);

  @override
  State<BattleRoomMemberListPage> createState() =>
      _BattleRoomMemberListPageState();
}

class _BattleRoomMemberListPageState extends State<BattleRoomMemberListPage> {
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
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            const SizedBox(
              width: 30,
              child: BackButton(),
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
      ),
    );
  }
}
