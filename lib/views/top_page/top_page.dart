import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/darts_function_page/darts_function_page.dart';
import 'package:darts_link_project/views/follow_page/follow_page.dart';
import 'package:darts_link_project/views/home_page/home_page.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/search_page/search_page.dart';
import 'package:darts_link_project/views/splash_page.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_page.dart';
import 'package:darts_link_project/views/thread_page/threads_page.dart';
import 'package:darts_link_project/views/time_line_page/time_line_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pages = [
    const HomePage(),
    const TimeLinePage(),
    const SearchPage(),
    const DartsFunctionPage(),
    const ThreadsPage(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    final appUser = AppUserRepository.fetchAppUser(user!.id);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white10,
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserImage(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            imageUrl: user.userImage,
            uid: user.id,
          ),
        ),
        title: SizedBox(
          width: 150,
          child: Image.asset('assets/images/logo2.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(NotificationPage.route());
              },
              child: const Icon(
                FeatherIcons.bell,
                color: Color.fromRGBO(247, 63, 150, 1),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(padding: const EdgeInsets.all(18.0), children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //  Navigator.of(context).push(ProfilePage.route());
                      },
                      child: UserImage(
                        width: 50,
                        height: 50,
                        imageUrl: user.userImage,
                        uid: user.id,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.userName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.userId,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(176, 176, 176, 1)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_horiz,
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
                    '${user.followingCount}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
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
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(176, 176, 176, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${user.followerCount}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Text(
                  'フォロワー',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(176, 176, 176, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 46,
            ),
            appUser is Person
                ? GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const MyPage()),
                        ),
                      );
                      setState(() {});
                    },
                    child: const Text(
                      'プロフィール',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                      setState(() {});
                    },
                    child: const Text(
                      '店舗ページ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                //  Navigator.of(context).push(ProfilePage.route());
              },
              child: const Text(
                '対戦者募集',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(ProfilePage.route());
              },
              child: const Text(
                'お気に入り店舗リスト',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                //   Navigator.of(context).push(CircleListDisplayPage.route());
              },
              child: const Text(
                'サークル一覧',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
                onTap: () async {
                  await AuthRepository.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const SplashPage()),
                      ));
                },
                child: const Text(
                  'ログアウト',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ]),
        ),
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: OriginalTheme.themeData.primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        selectedLabelStyle: const TextStyle(fontSize: 13),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
                icon: const Icon(Icons.home)),
            label: 'Top',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
                icon: const Icon(Icons.edit)),
            label: 'タイムライン',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
                icon: const Icon(Icons.search)),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    _index = 3;
                  });
                },
                icon: const Icon(Icons.ads_click)),
            label: 'リーグ作成',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  setState(() {
                    _index = 4;
                  });
                },
                icon: const Icon(Icons.mail)),
            label: 'DM',
          ),
        ],
      ),
    );
  }
}
