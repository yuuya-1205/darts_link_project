// ignore_for_file: use_build_context_synchronously

import 'package:darts_link_project/components/delele_snack_bar.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/circle/circle_join_request.dart';
import 'package:darts_link_project/models/circle/circle_member.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_join_request_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/circle_page/circle_info_page.dart';
import 'package:darts_link_project/views/circle_page/circle_member_approved_list_page.dart';
import 'package:darts_link_project/views/circle_page/circle_member_list_page.dart';
import 'package:darts_link_project/views/circle_page/circle_post_image_page.dart';
import 'package:darts_link_project/views/circle_page/circle_post_list_page.dart';
import 'package:darts_link_project/views/circle_page/create_circle_time_line_page.dart';
import 'package:darts_link_project/views/circle_page/edit_circle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CircleDetailPage extends StatefulWidget {
  const CircleDetailPage({Key? key, required this.circle}) : super(key: key);

  final Circle circle;

  @override
  State<CircleDetailPage> createState() => _CircleDetailPageState();
}

class _CircleDetailPageState extends State<CircleDetailPage> {
  String? myUid = AuthRepository.currentUser!.id;
  List<CircleMember> circleMembers = [];
  Future<CircleMemberType> getMemberType() async {
    if (myUid == null) {
      return CircleMemberType.joinable;
    }
    if (myUid == widget.circle.ownerId) {
      return CircleMemberType.owner;
    }
    if (widget.circle.isApproved == true) {
      final circleJoinRequest =
          await CircleJoinRequestRepository.fetchCircleJoinRequest(
        circleId: widget.circle.circleId,
        uid: myUid!,
      );
      if (circleJoinRequest == null) {
        return CircleMemberType.beforeRequesting;
      }
      if (circleJoinRequest.status == CircleJoinRequestStatus.requesting) {
        return CircleMemberType.requesting;
      }
      return CircleMemberType.joined;
    }
    final isJoined = circleMembers.map((e) => e.uid).toList().contains(myUid);
    if (isJoined == true) {
      return CircleMemberType.joined;
    }
    return CircleMemberType.joinable;
  }

  Asset? asset;
  Map<String, Widget> tabPageMaps = {};
  @override
  void initState() {
    tabPageMaps = {
      'TOP': CircleInfoPage(
        circle: widget.circle,
      ),
      '投稿': CirclePostListPage(
        circle: widget.circle,
      ),
      '画像': CirclePostImagePage(
        circle: widget.circle,
      ),
    };

    super.initState();
  }

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
          actions: [
            FutureBuilder<CircleMemberType>(
                future: getMemberType(),
                builder: (builder, snapshot) {
                  return snapshot.data == CircleMemberType.owner
                      ? PopupMenuButton(onSelected: (value) {
                          if (value == '') {
                            final uid = AuthRepository.currentUser!.id;
                          }
                        }, itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => EditCirclePage(
                                            circle: widget.circle,
                                          )),
                                    ),
                                  );
                                },
                                child: const Text('編集'),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'memberList',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          CircleMemberListPage(
                                            circle: widget.circle,
                                          )),
                                    ),
                                  );
                                },
                                child: const Text('メンバーリスト'),
                              ),
                            ),
                            if (widget.circle.isApproved == true)
                              PopupMenuItem(
                                value: 'approvedList',
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            CircleMemberApprovedListPage(
                                              circle: widget.circle,
                                            )),
                                      ),
                                    );
                                  },
                                  child: const Text('申請リスト'),
                                ),
                              ),
                            PopupMenuItem(
                              value: 'delete',
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Row(
                                          children: const [
                                            Icon(
                                              FeatherIcons.alertTriangle,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              'このイベントを本当に削除しますか？',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          // ボタン領域
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FollowApproveButton(
                                                onPressed: () async {
                                                  await CircleRepository
                                                      .deleteCircle(
                                                          widget.circle);

                                                  Navigator.pop(context);
                                                  DeleteSnackBar.showSnackBar(
                                                      context);
                                                },
                                                text: '削除する',
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              FollowApproveButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                text: 'キャンセル',
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('削除'),
                              ),
                            ),
                          ];
                        })
                      : Container();
                }),
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
                      headerImageUrl: widget.circle.imageUrls.isEmpty
                          ? ''
                          : widget.circle.imageUrls.first,
                    ),
                  ),
                  Container(
                    color: Colors.white.withOpacity(0.5),
                    child: Row(
                      children: [
                        UserImage(
                            height: 50,
                            width: 50,
                            imageUrl: widget.circle.createrImage,
                            uid: widget.circle.ownerId),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.circle.circleName,
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
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                        'メンバー${widget.circle.numberOfParticipants}人'),
                                  ),
                                  const Text('/'),
                                  Text('エリア:${widget.circle.city!.name}'),
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
        floatingActionButton: myUid == widget.circle.ownerId
            ? FloatingActionButton(
                backgroundColor: OriginalTheme.themeData.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CreateCircleTimeLinePage(
                            circle: widget.circle,
                          )),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                ),
              )
            : Container());
  }
}
