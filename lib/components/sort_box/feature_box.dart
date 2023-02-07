import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({Key? key, this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 246, 217, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(189, 208, 66, 1)),
        ),
        width: 75,
        height: 75,
        child: Column(
          children: const [
            SizedBox(
              height: 13,
            ),
            Icon(
              Icons.calendar_month_outlined,
              color: Color.fromRGBO(189, 208, 66, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '特徴',
                style: TextStyle(
                  color: Color.fromRGBO(189, 208, 66, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
