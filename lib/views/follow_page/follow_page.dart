import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/follow_page/follow_list_page.dart';
import 'package:darts_link_project/views/follow_page/follower_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          'フォロー/フォロワー一覧',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
