import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/models/thread.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/thread_page/thread_chat_page.dart';
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
  final user = AuthRepository.currentUser;
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
      '画像': UserImagePostPage(),
    };
    // TODO: implement initState
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
                    headerImageUrl: widget.appUser is Person
                        ? (widget.appUser as Person).headerImage
                        : (widget.appUser as StoreOwner).headerImages.first,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      UserImage(
                          height: 50,
                          width: 50,
                          imageUrl: widget.appUser.userImage,
                          uid: widget.appUser.id),
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
                                  icon: Icon(FeatherIcons.mail),
                                  onPressed: () async {
                                    final uids = [user!.id, widget.appUser.id];
                                    uids.sort();
                                    final threadId =
                                        '${uids.first}${uids.last}';
                                    late final Thread thread;
                                    final result = await ThreadRepository
                                        .fetchThreadByMemberIds(threadId);

                                    if (result == null) {
                                      thread = Thread(
                                        unReadCount: {
                                          uids.first: 0,
                                          uids.last: 0
                                        },
                                        id: threadId,
                                        uids: uids,
                                        createdAt: Timestamp.now(),
                                        isReading: false,
                                        updatedAt: Timestamp.now(),
                                        memberDetails: {
                                          user!.id: {
                                            'name': user!.userName,
                                            'imageUrl': user!.userImage,
                                          },
                                          widget.appUser.id: {
                                            'name': widget.appUser.userName,
                                            'imageUrl':
                                                widget.appUser.userImage,
                                          }
                                        },
                                      );
                                      await ThreadRepository.createThread(
                                          thread);
                                    } else {
                                      thread = result;
                                    }
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => ThreadChatPage(
                                              isReading: true,
                                              thread: thread,
                                            )),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FollowRepository.followingStream(
                                        followingUid: widget.appUser.id,
                                        uid: user!.id),
                                    builder: (context, snapshots) {
                                      if (snapshots.hasData &&
                                          snapshots.data!.docs.isNotEmpty) {
                                        return FollowApproveButton(
                                          onPressed: () async {
                                            final user =
                                                AuthRepository.currentUser;
                                            await FollowRepository.unFollowing(
                                                uid: user!.id,
                                                followingUid:
                                                    widget.appUser.id);
                                          },
                                          text: 'フォロー解除',
                                        );
                                      }

                                      return FollowApproveButton(
                                        onPressed: () async {
                                          await FollowRepository.setFollowing(
                                              follow: Follow(
                                                  createdAt: Timestamp.now(),
                                                  followingUid:
                                                      widget.appUser.id,
                                                  userId: widget.appUser.userId,
                                                  userImage:
                                                      widget.appUser.userImage,
                                                  userName:
                                                      widget.appUser.userName),
                                              uid: user!.id);
                                        },
                                        text: 'フォローする',
                                      );
                                    }),
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
}
