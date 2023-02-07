import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String? text;
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
        primary: primary,
        onPrimary: onPrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
