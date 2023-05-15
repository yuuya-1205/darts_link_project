import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

import 'create_time_line_page.dart';
import 'follow_time_line_page.dart';
import 'whole_time_line_page.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> tabPageMaps = {
      '全体': const WholeTimeLinePage(),
      'フォロー': const FollowTimeLinePage(),
    };
    return Scaffold(
      body: DefaultTabController(
        length: tabPageMaps.length,
        child: Column(children: [
          TabBar(
              indicatorColor: OriginalTheme.themeData.primaryColor,
              labelColor: OriginalTheme.themeData.primaryColor,
              unselectedLabelColor: OriginalTheme.themeData.disabledColor,
              labelStyle: const TextStyle(fontSize: 12),
              tabs: tabPageMaps.keys
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
          Expanded(
            child: TabBarView(children: tabPageMaps.values.toList()),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: OriginalTheme.themeData.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const CreateTimeLinePage()),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
