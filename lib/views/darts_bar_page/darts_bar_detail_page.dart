import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_info_page.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_post_image.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_post_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

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
    return Scaffold(
      appBar: const OriginalAppBer(
          // actions: [
          //   FutureBuilder<CircleMemberType>(
          //       future: getMemberType(),
          //       builder: (builder, snapshot) {
          //         return snapshot.data == CircleMemberType.owner
          //             ? PopupMenuButton(onSelected: (value) {
          //                 if (value == '') {
          //                   final uid = AuthRepository.currentUser!.id;
          //                 }
          //               }, itemBuilder: (context) {
          //                 return [
          //                   PopupMenuItem(
          //                     value: 'edit',
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                             builder: ((context) => EditDartsBarPage(
          //                                   storeOwner: widget.storeOwner,
          //                                 )),
          //                           ),
          //                         );
          //                       },
          //                       child: const Text('編集'),
          //                     ),
          //                   ),
          //                   PopupMenuItem(
          //                     value: 'memberList',
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                               builder: ((context) => EditDartsBarPage(
          //                                     storeOwner: widget.storeOwner,
          //                                   )),
          //                             ));
          //                       },
          //                       child: const Text('メンバーリスト'),
          //                     ),
          //                   ),
          //                   if (widget.storeOwner.isApproved == true)
          //                     PopupMenuItem(
          //                       value: 'approvedList',
          //                       child: GestureDetector(
          //                         onTap: () {},
          //                         child: const Text('申請リスト'),
          //                       ),
          //                     ),
          //                   PopupMenuItem(
          //                     value: 'delete',
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         showDialog(
          //                           context: context,
          //                           builder: (_) {
          //                             return AlertDialog(
          //                               title: Row(
          //                                 children: const [
          //                                   Icon(
          //                                     FeatherIcons.alertTriangle,
          //                                     color: Colors.yellow,
          //                                   ),
          //                                   Text(
          //                                     'このイベントを本当に削除しますか？',
          //                                     style: TextStyle(
          //                                       fontWeight: FontWeight.bold,
          //                                       fontSize: 14,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                               actions: [
          //                                 // ボタン領域
          //                                 Row(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.center,
          //                                   children: [
          //                                     FollowApproveButton(
          //                                       onPressed: () async {
          //                                         // await CircleRepository
          //                                         //     .deleteCircle(
          //                                         //         widget.circle);

          //                                         // Navigator.pop(context);
          //                                         // DeleteSnackBar.showSnackBar(
          //                                         //     context);
          //                                       },
          //                                       text: '削除する',
          //                                     ),
          //                                     const SizedBox(
          //                                       width: 15,
          //                                     ),
          //                                     FollowApproveButton(
          //                                       onPressed: () {
          //                                         Navigator.pop(context);
          //                                       },
          //                                       text: 'キャンセル',
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ],
          //                             );
          //                           },
          //                         );
          //                       },
          //                       child: const Text('削除'),
          //                     ),
          //                   ),
          //                 ];
          //               })
          //             : Container();
          //       }),
          // ],
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
                    headerImageUrl: widget.storeOwner.headerImages.isEmpty
                        ? ''
                        : widget.storeOwner.headerImages.first,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      UserImage(imageUrl: widget.storeOwner.userImage),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.storeOwner.userName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                                const Icon(FeatherIcons.mail),
                                const SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('エリア:${widget.storeOwner.city.name}'),
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
    );
  }
}
