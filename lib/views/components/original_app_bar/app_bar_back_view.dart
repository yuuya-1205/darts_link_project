import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class AppBarBackView extends StatelessWidget {
  const AppBarBackView({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(children: [
        SizedBox(width: 30, child: BackButton(color: color)),
        Text(
          '戻る',
          style: TextStyle(
            color: color ?? OriginalTheme.themeData.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }
}
