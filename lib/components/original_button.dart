import 'package:darts_link_project/constant/color.dart' as constant;
import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? primary;
  final Color? onPrimary;
  final TextStyle? style;

  const OriginalButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.primary,
    this.onPrimary,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary ?? constant.primary,
        foregroundColor: onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
