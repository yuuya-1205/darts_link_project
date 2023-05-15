import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:flutter/material.dart';

class FavoriteStoreListPage extends StatefulWidget {
  const FavoriteStoreListPage({super.key});

  @override
  State<FavoriteStoreListPage> createState() => _FavoriteStoreListPageState();
}

class _FavoriteStoreListPageState extends State<FavoriteStoreListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OriginalAppBer(title: 'お気に入り店舗一覧'),
      body: Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
}
