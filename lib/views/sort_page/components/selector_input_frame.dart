import 'package:flutter/material.dart';

class SelectorInputFrame extends StatelessWidget {
  const SelectorInputFrame({
    Key? key,
    required this.title,
    this.value,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String? value;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value ?? '未選択',
              style: TextStyle(
                  color: value == null ? Colors.grey.withOpacity(0.5) : null),
            ),
          ),
        ),
      ],
    );
  }
}
