import 'package:flutter/material.dart';

class OriginalText extends StatelessWidget {
  const OriginalText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(text),
    );
  }
}
