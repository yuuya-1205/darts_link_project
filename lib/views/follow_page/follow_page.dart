import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/follow_page/follow_list_page.dart';
import 'package:darts_link_project/views/follow_page/follower_list_page.dart';
import 'package:flutter/material.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({Key? key}) : super(key: key);

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  Map<String, Widget> tabPageMaps = {
    'フォロー': const FollowListPage(),
    'フォロワー': const FollowerListPage(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OriginalAppBer(title: 'フォロー/フォロワー一覧'),
      body: DefaultTabController(
        length: tabPageMaps.length,
        child: Column(children: [
          TabBar(
              indicatorColor: OriginalTheme.themeData.primaryColor,
              labelColor: OriginalTheme.themeData.primaryColor,
              unselectedLabelColor: OriginalTheme.themeData.disabledColor,
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
    );
  }
}
