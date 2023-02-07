import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/circle.dart';
import 'package:darts_link_project/repositories/algolia_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/search_page/search_battle_room_page.dart';
import 'package:darts_link_project/views/search_page/search_circle_page.dart';
import 'package:darts_link_project/views/search_page/search_house_tornament_page.dart';
import 'package:darts_link_project/views/search_page/search_user_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final _searchTextController = TextEditingController();
    String _searchText;
    bool _isLoading = false;
    List<AppUser> _searchResultAppUsers;
    List<BattleRoom> _searchResultbBattleRooms;
    List<Circle> _searchResultCircles;
    //   List<HouseTornament> _serchResultHouseTornaments;
    //   List<HouseTornament> _serchResultHouseTornaments;

    Map<String, Widget> tabPageMaps = {
      'ユーザー': const SearchUserPage(),
      '対戦者募集': const SearchBattleRoomPage(),
      'サークル': const SearchCirclePage(),
      'ハウトー': const SearchHouseTornamentPage(),
    };
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
        title: TextFormField(
          onEditingComplete: () async {
            if (_searchTextController.text.isEmpty) {
              return;
            }

            if (_isLoading) {
              return;
            }
            setState(() {
              _isLoading = true;
            });
            _searchText = _searchTextController.text;
            // _searchResultAppUsers =
            //     await AlgoliaRepository().searchPosts(_searchText);
            _searchResultbBattleRooms =
                await AlgoliaRepository().searchBattleRooms(_searchText);
            // _searchResultCircles =
            //     await AlgoliaRepository().searchDartsbars(_searchText);

            setState(() {
              _isLoading = false;
            });
          },
          controller: _searchTextController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
            hintText: 'キーワード検索',
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.all(1),
          ),
        ),
      ),
      body: DefaultTabController(
        length: tabPageMaps.length,
        child: Column(
          children: [
            //const BannerAdView(),
            TabBar(
                indicatorColor: OriginalTheme.themeData.primaryColor,
                labelColor: OriginalTheme.themeData.primaryColor,
                unselectedLabelColor: OriginalTheme.themeData.disabledColor,
                labelStyle: const TextStyle(fontSize: 12),
                tabs: tabPageMaps.keys
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList()),
            Expanded(
              child: TabBarView(children: tabPageMaps.values.toList()),
            ),
          ],
        ),
      ),
    );
  }
}
