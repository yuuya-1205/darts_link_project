import 'package:flutter/material.dart';

class CircleListPage extends StatefulWidget {
  const CircleListPage({super.key});

  @override
  State<CircleListPage> createState() => _CircleListPageState();
}

class _CircleListPageState extends State<CircleListPage> {
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
        actions: [],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
