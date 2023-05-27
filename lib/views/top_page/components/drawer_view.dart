import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/drawer_item.dart';
import 'package:darts_link_project/views/follow_page/follow_page.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key, required this.currentUser}) : super(key: key);
  final AppUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
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
                    child: UserImage(imageUrl: currentUser.userImage),
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
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
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
            ),
            const SizedBox(height: 24),
            ...currentUser is Person
                ? DrawerItem.personDrawerItems(isAdmin: currentUser.isAdmin)
                    .map((e) => DrawerItemView(drawerItem: e))
                : DrawerItem.storeOwnerDrawerItems(isAdmin: currentUser.isAdmin)
                    .map((e) => DrawerItemView(drawerItem: e)),
          ],
        ),
      ),
    );
  }
}

class DrawerItemView extends StatelessWidget {
  const DrawerItemView({Key? key, required this.drawerItem}) : super(key: key);
  final DrawerItem drawerItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => drawerItem.onTap(Navigator.of(context)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: Text(
              drawerItem.label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
