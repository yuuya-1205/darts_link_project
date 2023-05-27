import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/tag_list_view.dart';
import 'package:darts_link_project/views/darts_bar/components/darts_bar_header_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../components/follow_button.dart';
import '../../components/original_app_bar/app_bar_back_view.dart';
import 'darts_bar_info_page.dart';
import 'darts_bar_post_image.dart';
import 'darts_bar_post_list_page.dart';

class DartsBarDetailPage extends StatefulWidget {
  const DartsBarDetailPage({super.key, required this.storeOwner});

  final StoreOwner storeOwner;

  @override
  State<DartsBarDetailPage> createState() => _DartsBarDetailPageState();
}

class _DartsBarDetailPageState extends State<DartsBarDetailPage> {
  String? myUid = AuthRepository.currentUser!.id;
  Asset? asset;
  Map<String, Widget> tabPageMaps = {};
  @override
  void initState() {
    tabPageMaps = {
      'TOP': DartsBarInfoPage(
        storeOwner: widget.storeOwner,
      ),
      '投稿': DartsBarPostList(
        storeOwner: widget.storeOwner,
      ),
      '画像': DartsBarPostImage(
        storeOwner: widget.storeOwner,
      ),
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        /// Android のステータスバーアイコンの色が変更される
        statusBarIconBrightness: Brightness.dark,

        /// iOS のステータスバーの文字色が変更される
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: DefaultTabController(
          length: tabPageMaps.length,
          child: Column(
            children: [
              _HeaderView(asset: asset, storeOwner: widget.storeOwner),
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
        // floatingActionButton: myUid == widget.storeOwner.userId
        //     ? FloatingActionButton(
        //         backgroundColor: OriginalTheme.themeData.primaryColor,
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: ((context) => CreateCircleTimeLinePage(
        //                     circle: widget.circle,
        //                   )),
        //             ),
        //           );
        //         },
        //         child: const Icon(
        //           Icons.add,
        //         ),
        //       )
        //     : Container()
      ),
    );
  }
}

class _HeaderView extends StatelessWidget {
  const _HeaderView({
    Key? key,
    required this.asset,
    required this.storeOwner,
  }) : super(key: key);
  static const double headerViewHeight = 240;
  final Asset? asset;
  final StoreOwner storeOwner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: headerViewHeight,
      child: Stack(
        children: [
          DartsBarHeaderImageView(
            height: headerViewHeight,
            asset: asset,
            headerImage: storeOwner.headerImages.isEmpty
                ? ''
                : storeOwner.headerImages.first,
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppBarBackView(color: Colors.white),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        splashRadius: 20,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserImage(imageUrl: storeOwner.userImage),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  storeOwner.userName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                FollowButton(user: storeOwner),
                                const SizedBox(width: 8),
                                const Icon(
                                  FeatherIcons.mail,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'エリア:${storeOwner.city.name}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TagListView(tags: storeOwner.tag)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
