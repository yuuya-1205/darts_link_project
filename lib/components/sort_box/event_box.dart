import 'package:flutter/material.dart';

class EventBox extends StatelessWidget {
  const EventBox({Key? key, this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(227, 243, 255, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(78, 165, 229, 1)),
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
              color: Color.fromRGBO(78, 165, 229, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '種目',
                style: TextStyle(
                  color: Color.fromRGBO(68, 160, 227, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
