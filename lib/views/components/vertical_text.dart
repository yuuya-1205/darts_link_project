import 'package:darts_link_project/utils/const.dart';
import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  const VerticalText(
    this.text, {
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final splitText = text.split("\n");
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        for (var s in splitText) _textBox(s.runes),
      ],
    );
  }

  Widget _textBox(Runes runes) {
    return Wrap(
      textDirection: TextDirection.rtl,
      direction: Axis.vertical,
      children: [for (var rune in runes) _character(String.fromCharCode(rune))],
    );
  }

  Widget _character(String char) {
    if (verticalRotatedMap[char] != null) {
      return Text(verticalRotatedMap[char]!, style: style);
    } else {
      return Text(char, style: style);
    }
  }
}
