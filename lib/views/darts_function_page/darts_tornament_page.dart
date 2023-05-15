import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
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
      appBar: const OriginalAppBer(title: 'トーナメント機能'),
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
