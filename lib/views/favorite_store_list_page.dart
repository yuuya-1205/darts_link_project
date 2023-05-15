import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/favorite_store_owner.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/components/list_item_view.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:flutter/material.dart';

import '../repositories/favorite_store_owner_repository.dart';

class FavoriteStoreListPage extends StatefulWidget {
  const FavoriteStoreListPage({super.key});

  @override
  State<FavoriteStoreListPage> createState() => _FavoriteStoreListPageState();
}

class _FavoriteStoreListPageState extends State<FavoriteStoreListPage> {
  final currentUser = AuthRepository.currentUser;

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      throw Exception('currentUser is null');
    }

    return Scaffold(
      appBar: const OriginalAppBer(title: 'お気に入り店舗一覧'),
      body: StreamBuilder(
        stream: FavoriteStoreOwnerRepository.favoriteStoreOwnerStream(
          myUid: currentUser!.id,
        ),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('お気に入り店舗はありません'),
            );
          }
          final favoriteStoreOwners = snapshot.data!.docs
              .map((e) => e.data())
              .whereType<FavoriteStoreOwner>()
              .toList();
          return ListView.builder(
            itemCount: favoriteStoreOwners.length,
            itemBuilder: (_, index) {
              final favoriteStoreOwner = favoriteStoreOwners[index];
              return ListItemView(
                imageUrl: favoriteStoreOwner.userImage,
                name: favoriteStoreOwner.userName,
                trailing: OriginalButton(
                  text: 'お気に入り解除',
                  onPressed: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
