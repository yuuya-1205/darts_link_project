import 'package:flutter/material.dart';

class TornamentBattlePage extends StatefulWidget {
  const TornamentBattlePage({Key? key}) : super(key: key);

  @override
  State<TornamentBattlePage> createState() => _TornamentBattlePageState();
}

class _TornamentBattlePageState extends State<TornamentBattlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トーナメント戦'),
      ),
      body: Column(children: [
        Row(
          children: const [
            Text('参加チーム'),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('作成'),
        )
      ]),
    );
  }
}
