import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/auth_page/login_page.dart';
import 'package:darts_link_project/views/auth_page/store_owner_approve_page.dart';
import 'package:darts_link_project/views/battle_room_page/create_battle_room_page.dart';
import 'package:darts_link_project/views/circle_page/circle_list_page.dart';
import 'package:darts_link_project/views/favorite_store/favorite_store_list_page.dart';
import 'package:darts_link_project/views/my_page/my_page.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_page.dart';
import 'package:flutter/material.dart';

enum DrawerItem {
  storeApplicationManagement(
    label: '店舗申請管理',
    navigatePage: StoreOwnerApprovePage(),
  ),
  profile(
    label: 'プロフィール',
    navigatePage: MyPage(),
  ),
  store(
    label: '店舗ページ',
    navigatePage: StoreOwnerPage(),
  ),
  createBattleRoom(
    label: '対戦者募集',
    navigatePage: CreateBattleRoomPage(),
  ),
  favoriteStoreList(
    label: 'お気に入り店舗リスト',
    navigatePage: FavoriteStoreListPage(),
  ),
  circleList(
    label: 'サークル一覧',
    navigatePage: CircleListPage(),
  ),
  signOut(
    label: 'ログアウト',
    navigatePage: LoginPage(),
  );

  const DrawerItem({required this.label, required this.navigatePage});
  final String label;
  final Widget navigatePage;

  Future<void> onTap(NavigatorState navigator) async {
    switch (this) {
      case DrawerItem.storeApplicationManagement:
      case DrawerItem.profile:
      case DrawerItem.store:
      case DrawerItem.createBattleRoom:
      case DrawerItem.favoriteStoreList:
      case DrawerItem.circleList:
        navigator
          ..pop()
          ..push(MaterialPageRoute(builder: ((context) => navigatePage)));
        break;
      case DrawerItem.signOut:
        await AuthRepository.signOut();
        navigator
          ..pop()
          ..push(MaterialPageRoute(builder: ((context) => navigatePage)));
        break;
    }
  }

  static List<DrawerItem> personDrawerItems({required bool isAdmin}) {
    return [
      if (isAdmin) DrawerItem.storeApplicationManagement,
      DrawerItem.profile,
      DrawerItem.createBattleRoom,
      DrawerItem.favoriteStoreList,
      DrawerItem.circleList,
      DrawerItem.signOut,
    ];
  }

  static List<DrawerItem> storeOwnerDrawerItems({required bool isAdmin}) {
    return [
      if (isAdmin) DrawerItem.storeApplicationManagement,
      DrawerItem.store,
      DrawerItem.createBattleRoom,
      DrawerItem.favoriteStoreList,
      DrawerItem.circleList,
      DrawerItem.signOut,
    ];
  }
}
