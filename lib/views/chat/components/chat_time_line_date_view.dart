import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';

class ChatTimeLineDateView extends StatelessWidget {
  const ChatTimeLineDateView(this.sendTime, {super.key});
  final Timestamp sendTime;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayDuration = now.day - sendTime.toDate().day;
    final label = dayDuration == 0 ? '今日' : sendTime.toDate().formatYMD;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(label, style: const TextStyle(color: unselectedColor)),
    );
  }
}
