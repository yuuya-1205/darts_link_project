import 'package:darts_link_project/models/circle.dart';
import 'package:flutter/material.dart';

class EditCirclePage extends StatefulWidget {
  const EditCirclePage({Key? key, required this.circle}) : super(key: key);

  final Circle circle;

  @override
  State<EditCirclePage> createState() => _EditCirclePageState();
}

class _EditCirclePageState extends State<EditCirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
            ),
            const Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
