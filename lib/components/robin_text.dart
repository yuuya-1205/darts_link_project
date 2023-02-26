import 'package:flutter/material.dart';

class RobinText extends StatelessWidget {
  const RobinText({
    super.key,
    this.width,
    required this.text,
  });

  final double? width;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 129, 189, 1),
      width: width,
      height: 50,
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}

class RobinTextSecond extends StatelessWidget {
  const RobinTextSecond({
    super.key,
    this.width,
    required this.text,
  });

  final double? width;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
