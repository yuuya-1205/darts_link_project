import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/auth_page/store_owner_approve_page.dart';
import 'package:darts_link_project/views/battle_room_page/create_battle_room_page.dart';
import 'package:darts_link_project/views/circle_page/circle_list_page.dart';
import 'package:darts_link_project/views/favorite_store_list_page.dart';
import 'package:darts_link_project/views/follow_page/follow_page.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/splash_page.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_page.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key, required this.currentUser}) : super(key: key);
  final AppUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18.0),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: ((context) => const EditMyInfoPage()),
                    //   ),
                    // );
                  },
                  child: UserImage(
                    width: 50,
                    height: 50,
                    imageUrl: currentUser.userImage,
                    uid: currentUser.id,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentUser.userId,
                      style: const TextStyle(fontSize: 12, color: grey),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_horiz),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FollowPage()),
                      ),
                    );
                  },
                  child: Text(
                    '${currentUser.followingCount}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FollowPage()),
                      ),
                    );
                  },
                  child: const Text(
                    'フォロー',
                    style: TextStyle(fontSize: 12, color: grey),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FollowPage()),
                      ),
                    );
                  },
                  child: Text(
                    '${currentUser.followerCount}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FollowPage()),
                      ),
                    );
                  },
                  child: const Text(
                    'フォロワー',
                    style: TextStyle(fontSize: 12, color: grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (currentUser.isAdmin == true)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const StoreOwnerApprovePage()),
                    ),
                  );
                },
                child: const Text(
                  '店舗申請管理',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 24),
            currentUser is Person
                ? GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const MyPage()),
                        ),
                      );
                      // setState(() {});
                    },
                    child: const Text(
                      'プロフィール',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const StoreOwnerPage()),
                        ),
                      );
                      // setState(() {});
                    },
                    child: const Text(
                      '店舗ページ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const CreateBattleRoomPage()),
                  ),
                );
              },
              child: const Text(
                '対戦者募集',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const FavoriteStoreListPage()),
                  ),
                );
              },
              child: const Text(
                'お気に入り店舗リスト',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const CircleListPage()),
                  ),
                );
              },
              child: const Text(
                'サークル一覧',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                await AuthRepository.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SplashPage()),
                  ),
                );
              },
              child: const Text(
                'ログアウト',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
