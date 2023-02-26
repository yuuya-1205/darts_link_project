import 'package:darts_link_project/components/robin_text.dart';
import 'package:flutter/material.dart';

class RoundRobinWinLoseListPage extends StatefulWidget {
  const RoundRobinWinLoseListPage({super.key});

  @override
  State<RoundRobinWinLoseListPage> createState() =>
      _RoundRobinWinLoseListPageState();
}

class _RoundRobinWinLoseListPageState extends State<RoundRobinWinLoseListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            RobinText(
              width: 114,
              text: '順位',
            ),
            RobinText(
              width: 170,
              text: 'チーム',
            ),
            RobinText(
              width: 65,
              text: '勝ち数',
            ),
            RobinText(
              width: 65,
              text: '負け数',
            ),
          ],
        )
      ],
    );
  }
}
