import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/time_line_tab_type.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

import 'create_time_line_page.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: TimeLineTabType.values.length,
        child: Column(children: [
          TabBar(
              indicatorColor: deepPrimary,
              labelColor: deepPrimary,
              unselectedLabelColor: unselectedColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: TimeLineTabType.values
                  .map((e) => Tab(
                        text: e.label,
                      ))
                  .toList()),
          const Divider(height: 0, thickness: 1),
          Expanded(
              child: TabBarView(
            children: TimeLineTabType.values.map((e) => e.page).toList(),
          )),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
