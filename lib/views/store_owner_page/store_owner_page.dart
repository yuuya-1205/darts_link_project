import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_info_page.dart';
import 'package:darts_link_project/views/store_owner_page/edit_store_owner_page.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_post_image_page.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_post_list_page.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../time_line/create_time_line_page.dart';

class StoreOwnerPage extends StatefulWidget {
  const StoreOwnerPage({
    super.key,
  });

  @override
  State<StoreOwnerPage> createState() => _StoreOwnerPageState();
}

class _StoreOwnerPageState extends State<StoreOwnerPage> {
  final user = AuthRepository.currentUser as StoreOwner?;

  Asset? asset;
  Map<String, Widget> tabPageMaps = {};
  @override
  void initState() {
    tabPageMaps = {
      'TOP': DartsBarInfoPage(storeOwner: user!),
      '投稿': const StoreOwnerPostListPage(),
      '画像': const StoreOwnerImagePage(),
    };
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      throw Exception('ログインしていません');
    }
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
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const EditStoreOwnerPage()),
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
                      headerImageUrl: user!.headerImages.isEmpty
                          ? ''
                          : user!.headerImages.first),
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
                                Text('エリア:${user!.city.name}')
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
