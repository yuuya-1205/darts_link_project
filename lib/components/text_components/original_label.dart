import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class OriginalLabel extends StatelessWidget {
  const OriginalLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: OriginalTheme.themeData.disabledColor),
      ),
    );
  }
}
