import 'package:flutter/material.dart';

class TagDesign extends StatelessWidget {
  const TagDesign({
    Key? key,
    this.width,
    this.decoration,
    this.hight,
  }) : super(key: key);
  final double? width;
  final Decoration? decoration;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      width: width,
    );
  }
}
