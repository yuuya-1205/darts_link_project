import 'package:darts_link_project/views/darts_function_page/darts_function_page.dart';
import 'package:darts_link_project/views/darts_function_page/singles_page.dart';
import 'package:flutter/material.dart';

class DartsTornamentPage extends StatefulWidget {
  const DartsTornamentPage({Key? key}) : super(key: key);

  @override
  State<DartsTornamentPage> createState() => _DartsTornamentPageState();
}

class _DartsTornamentPageState extends State<DartsTornamentPage> {
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
        title: const Text(
          'トーナメント機能',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const SinglesPage()),
              ),
            );
          },
          child: const OriginalContainer(
            text: 'シングルス',
          ),
        ),
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
            text: 'ダブルス',
          ),
        ),
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
            text: 'トリオス',
          ),
        ),
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
            text: 'ガロン',
          ),
        ),
      ]),
    );
  }
}
