import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/my_page/edit_my_info_page.dart';
import 'package:darts_link_project/views/my_page/my_info_page.dart';
import 'package:darts_link_project/views/my_page/my_post_image_list.dart';
import 'package:darts_link_project/views/my_page/my_post_list_page.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final user = AuthRepository.currentUser as Person?;
  Asset? asset;
  Map<String, Widget> tabPageMaps = {};
  @override
  void initState() {
    tabPageMaps = {
      'TOP': const MyInfoPage(),
      '投稿': const MyPostListPage(),
      '画像': const MyPostImageList(),
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OriginalAppBer(
        actions: [
          PopupMenuButton<String>(
              onSelected: (value) => value,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "edit",
                    child: GestureDetector(
                      onTap: () async {
                        await PersonRepository.fetchPerson(user!.id);
                        // ignore: use_build_context_synchronously
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const EditMyInfoPage()),
                          ),
                        );
                      },
                      child: const Text("編集"),
                    ),
                  ),
                ];
              })
        ],
      ),
      body: DefaultTabController(
        length: tabPageMaps.length,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Stack(alignment: Alignment.bottomLeft, children: [
                SizedBox(
                  height: 205,
                  width: double.infinity,
                  child: HeaderImageUrl(
                    asset: asset,
                    headerImageUrl: user!.headerImage,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      UserImage(imageUrl: user!.userImage),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  user!.userName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('フォロー${user!.followingCount}人'),
                                const Text('/'),
                                Text('フォロワー${user!.followerCount}人'),
                                const Text('/'),
                                Text('エリア:${user!.city?.name ?? '未登録'}')
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
              TabBar(
                  indicatorColor: OriginalTheme.themeData.primaryColor,
                  labelColor: OriginalTheme.themeData.primaryColor,
                  unselectedLabelColor: OriginalTheme.themeData.disabledColor,
                  tabs: tabPageMaps.keys
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList()),
              Expanded(
                  child: TabBarView(
                children: tabPageMaps.values.toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
