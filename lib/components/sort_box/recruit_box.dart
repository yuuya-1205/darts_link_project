import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecruitBox extends StatelessWidget {
  const RecruitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 251, 211, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromRGBO(223, 211, 0, 1))),
      width: 75,
      height: 75,
      child: Column(
        children: const [
          SizedBox(
            height: 13,
          ),
          Icon(
            Icons.location_pin,
            color: Color.fromRGBO(223, 211, 0, 1),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '募集中',
              style: TextStyle(
                color: Color.fromRGBO(223, 211, 0, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
