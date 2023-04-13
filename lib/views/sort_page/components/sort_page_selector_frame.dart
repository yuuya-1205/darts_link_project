import 'package:flutter/material.dart';

class SortPageSelectorFrame extends StatelessWidget {
  const SortPageSelectorFrame({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Divider(height: 0),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}
