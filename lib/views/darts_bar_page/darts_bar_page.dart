import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:flutter/material.dart';

class DartsBarPage extends StatefulWidget {
  const DartsBarPage({Key? key}) : super(key: key);

  @override
  State<DartsBarPage> createState() => _DartsBarPageState();
}

class _DartsBarPageState extends State<DartsBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: AreaBox(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
