import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<String> greetings = ['こんにちは', 'こんばんは', 'おはようございます'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: greetings.length, //配列の要素の数を表示する
          itemBuilder: (context, index) {
            //  print(greetings[index]);

            // print(greetings[2]); //indexは配列全ての要素
            return Container(
              color: Colors.amber,
              child: Text(greetings[index]),
            );
          }),
    );
  }
}
