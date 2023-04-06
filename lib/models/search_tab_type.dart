import 'package:darts_link_project/views/search_page/search_battle_room_page.dart';
import 'package:darts_link_project/views/search_page/search_circle_page.dart';
import 'package:darts_link_project/views/search_page/search_house_tornament_page.dart';
import 'package:darts_link_project/views/search_page/search_person_page.dart';
import 'package:darts_link_project/views/search_page/search_store_owner_page.dart';
import 'package:flutter/material.dart';

enum SearchTabType {
  persons('ユーザー'),
  battleRooms('対戦車募集'),
  circles('サークル'),
  houseTournaments('ハウトー'),
  storeOwners('ダーツバー');

  const SearchTabType(this.label);
  final String label;

  static List<Widget> getViews(String searchWord) {
    return SearchTabType.values.map((tabType) {
      final key = Key('${tabType.label}: $searchWord');
      switch (tabType) {
        case SearchTabType.persons:
          return SearchPersonPage(key: key, searchWord: searchWord);
        case SearchTabType.battleRooms:
          return SearchBattleRoomPage(key: key, searchWord: searchWord);
        case SearchTabType.circles:
          return SearchCirclePage(key: key, searchWord: searchWord);
        case SearchTabType.houseTournaments:
          return SearchHouseTournamentPage(key: key, searchWord: searchWord);
        case SearchTabType.storeOwners:
          return SearchStoreOwnerPage(key: key, searchWord: searchWord);
      }
    }).toList();
  }
}
