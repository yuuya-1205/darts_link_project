import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/models/member_detail.dart';
import 'package:darts_link_project/models/thread.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/chat/chat_page.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/user_page/user_image_post_page.dart';
import 'package:darts_link_project/views/user_page/user_info_page.dart';
import 'package:darts_link_project/views/user_page/user_post_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
    required this.appUser,
  }) : super(key: key);

  final AppUser appUser;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final currentUser = AuthRepository.currentUser;
  Asset? asset;
  Map<String, Widget> tabPageMaps = {};

  @override
  void initState() {
    tabPageMaps = {
      'TOP': UserInfoPage(
        appUser: widget.appUser,
      ),
      '投稿': UserPostListPage(
        appUser: widget.appUser,
      ),
      '画像': const UserImagePostPage(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      throw Exception('ログインしていません');
    }
    return Scaffold(
      appBar: const OriginalAppBer(),
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
                    headerImageUrl: widget.appUser is Person
                        ? (widget.appUser as Person).headerImage
                        : (widget.appUser as StoreOwner).headerImages.first,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      UserImage(imageUrl: widget.appUser.userImage),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.appUser.userName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(FeatherIcons.mail),
                                  onPressed: () => onTapChatIcon(),
                                ),
                                const SizedBox(width: 12),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FollowRepository.followingStream(
                                      reference: widget.appUser.reference!,
                                      uid: currentUser!.id),
                                  builder: (context, snapshots) {
                                    if (snapshots.hasData &&
                                        snapshots.data!.docs.isNotEmpty) {
                                      return FollowApproveButton(
                                        onPressed: () async {
                                          final user =
                                              AuthRepository.currentUser;
                                          await FollowRepository.unFollowing(
                                              uid: user!.id,
                                              followingUid: widget.appUser.id);
                                        },
                                        text: 'フォロー解除',
                                      );
                                    }

                                    return FollowApproveButton(
                                      onPressed: () async {
                                        final reference =
                                            widget.appUser.reference;
                                        if (reference == null) {
                                          throw Exception('フォローに失敗しました。');
                                        }
                                        await FollowRepository.setFollowing(
                                            follow: Follow(
                                                createdAt: Timestamp.now(),
                                                followingRef: reference,
                                                userId: widget.appUser.userId,
                                                userImage:
                                                    widget.appUser.userImage,
                                                userName:
                                                    widget.appUser.userName),
                                            uid: currentUser!.id);
                                      },
                                      text: 'フォローする',
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('フォロー${widget.appUser.followingCount}人'),
                                const Text('/'),
                                Text('フォロワー${widget.appUser.followerCount}人'),
                                const Text('/'),
                                Text(
                                    'エリア:${widget.appUser.city?.name ?? '未登録'}')
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

  Future<void> onTapChatIcon() async {
    final members = [currentUser!, widget.appUser];
    final memberIds = members.map((e) => e.id).toList()..sort();
    final navigator = Navigator.of(context);
    final thread = await ThreadRepository.fetchThreadById(
        '${memberIds.first}-${memberIds.last}');
    if (thread != null) {
      navigator.pushReplacement(
        MaterialPageRoute(
          builder: ((context) => ChatPage(
                thread: thread,
              )),
        ),
      );
      return;
    }

    final newThread = Thread(
      memberIds: memberIds,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      unreadCount: Map.fromIterables(memberIds, memberIds.map((e) => [])),
      memberDetails: Map.fromIterables(
        members.map((e) => e.id),
        members.map((e) => MemberDetail.fromAppUser(e)),
      ),
    );

    final reference = await ThreadRepository.createThread(newThread);

    navigator.pushReplacement(
      MaterialPageRoute(
        builder: ((context) => ChatPage(
              thread: newThread.copyWith(
                reference: reference,
              ),
            )),
      ),
    );
  }
}
