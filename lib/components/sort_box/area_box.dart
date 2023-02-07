import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class AreaBox extends StatelessWidget {
  const AreaBox({Key? key, this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 222, 238, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: OriginalTheme.themeData.primaryColor),
        ),
        width: 75,
        height: 75,
        child: Column(
          children: const [
            SizedBox(
              height: 13,
            ),
            Icon(
              Icons.location_pin,
              color: Color.fromRGBO(210, 48, 125, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'エリア',
                style: TextStyle(
                  color: Color.fromRGBO(210, 48, 125, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
