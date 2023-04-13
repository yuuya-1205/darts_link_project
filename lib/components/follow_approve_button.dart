import 'package:flutter/material.dart';

class FollowApproveButton extends StatelessWidget {
  const FollowApproveButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromRGBO(247, 63, 150, 1),
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Color.fromRGBO(247, 63, 150, 1),
          ),
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
