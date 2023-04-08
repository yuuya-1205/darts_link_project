import 'package:darts_link_project/models/button_color_type.dart';
import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonColorType colorType;
  final TextStyle? style;

  const OriginalButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.colorType = ButtonColorType.material,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorType.primary,
        foregroundColor: colorType.onPrimary,
        side: colorType == ButtonColorType.white
            ? BorderSide(color: colorType.onPrimary)
            : null,
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
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
