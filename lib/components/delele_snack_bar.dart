import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DeleteSnackBar {
  static void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).size.height - 100,
        // ),
        content: Row(
          children: const [
            Icon(
              FeatherIcons.checkCircle,
              color: Colors.white,
            ),
            Text('削除しました'),
          ],
        ),
      ),
    );
  }
}
