import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:darts_link_project/views/components/store_owner/store_owner_list_view.dart';
import 'package:flutter/material.dart';

class SearchStoreOwnerPage extends StatefulWidget {
  const SearchStoreOwnerPage({required this.searchWord, Key? key})
      : super(key: key);
  final String searchWord;

  @override
  State<SearchStoreOwnerPage> createState() => _SearchStoreOwnerPageState();
}

class _SearchStoreOwnerPageState extends State<SearchStoreOwnerPage> {
  List<StoreOwner> storeOwners = [];
  bool isLoading = true;

  void setLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result = await StoreOwnerRepository.fetchSearchedStoreOwners(
        widget.searchWord,
      );
      setState(() {
        storeOwners = result;
        setLoading(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchWord.isEmpty) {
      return const Center(child: Text('検索キーワードを入力してください。'));
    }
    if (isLoading) {
      return const LoadingView();
    }

    if (storeOwners.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return StoreOwnerListView(storeOwners: storeOwners);
  }
}
