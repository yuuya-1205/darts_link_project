import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.icondata,
    required this.label,
    required this.onPressed,
    this.iconColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  final IconData icondata;
  final String label;
  final void Function() onPressed;
  final Color iconColor;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            Icon(icondata, color: iconColor),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Text(label),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
