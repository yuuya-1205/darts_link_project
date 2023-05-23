import 'package:flutter/material.dart';

class UnreadBadgeView extends StatelessWidget {
  const UnreadBadgeView({Key? key, required this.unreadCount})
      : super(key: key);
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: unreadCount > 0
          ? const BoxDecoration(shape: BoxShape.circle, color: Colors.red)
          : null,
      alignment: Alignment.center,
      child: unreadCount > 0
          ? Text(
              '$unreadCount',
              style: const TextStyle(color: Colors.white),
            )
          : const Text(''),
    );
  }
}
