import 'package:darts_link_project/views/darts_function_page/darts_tornament_page.dart';
import 'package:flutter/material.dart';

class DartsFunctionPage extends StatefulWidget {
  const DartsFunctionPage({Key? key}) : super(key: key);

  @override
  State<DartsFunctionPage> createState() => _DartsFunctionPageState();
}

class _DartsFunctionPageState extends State<DartsFunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const DartsTornamentPage()),
            ),
          );
        },
        child: const OriginalContainer(
          text: 'トーナメント機能',
        ),
      ),
    ]);
  }
}

class OriginalContainer extends StatelessWidget {
  const OriginalContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7, top: 18, bottom: 18),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
      ),
    );
  }
}
