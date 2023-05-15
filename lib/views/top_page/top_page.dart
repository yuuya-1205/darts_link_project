import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/darts_function_page/darts_function_page.dart';
import 'package:darts_link_project/views/home_page/home_page.dart';
import 'package:darts_link_project/views/search_page/search_page.dart';
import 'package:darts_link_project/views/thread_page/threads_page.dart';
import 'package:darts_link_project/views/time_line_page/time_line_page.dart';
import 'package:darts_link_project/views/top_page/components/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TopPage extends StatefulWidget {
  const TopPage({
    Key? key,
  }) : super(key: key);

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
    const ThreadsPage(
      lastchatCount: '',
      threadId: '',
      uid: '',
    ),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;

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
            imageUrl: user!.userImage,
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
      drawer: DrawerView(currentUser: user),
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
