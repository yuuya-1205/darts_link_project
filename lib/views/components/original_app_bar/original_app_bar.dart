import 'package:flutter/material.dart';

import 'app_bar_back_view.dart';

class OriginalAppBer extends StatelessWidget implements PreferredSizeWidget {
  const OriginalAppBer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 76,
      title: Text(title),
      leading: const AppBarBackView(),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
