import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class AppBarBackView extends StatelessWidget {
  const AppBarBackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(children: [
        const SizedBox(width: 30, child: BackButton()),
        Text(
          '戻る',
          style: TextStyle(
            color: OriginalTheme.themeData.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }
}
