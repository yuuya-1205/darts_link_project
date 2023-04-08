import 'package:flutter/material.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 8),
          child: Text(text),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
