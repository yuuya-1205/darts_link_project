import 'package:darts_link_project/models/team.dart';
import 'package:flutter/material.dart';

class RoundRobinCard extends StatefulWidget {
  const RoundRobinCard({
    super.key,
    required this.team,
    required this.teamCount,
  });

  final Team team;
  final int teamCount;

  @override
  State<RoundRobinCard> createState() => _RoundRobinCardState();
}

class _RoundRobinCardState extends State<RoundRobinCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 48,
            ),
            Text(
              widget.teamCount.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Text(
              widget.team.teamName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Text(
              widget.team.totalWinCount.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.team.totalLoseCount.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
