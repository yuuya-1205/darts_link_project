import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/views/components/user_list/user_list_view.dart';
import 'package:flutter/material.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({required this.searchWord, Key? key}) : super(key: key);
  final String searchWord;

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  List<AppUser> _appUsers = [];

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result =
          await AppUserRepository.fetchAppUsersByUserName(widget.searchWord);
      setState(() {
        _appUsers = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_appUsers.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return UserListView(appUsers: _appUsers);
  }
}
