import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:darts_link_project/views/components/user_list/user_list_view.dart';
import 'package:flutter/material.dart';

class SearchPersonPage extends StatefulWidget {
  const SearchPersonPage({required this.searchWord, Key? key})
      : super(key: key);
  final String searchWord;

  @override
  State<SearchPersonPage> createState() => _SearchPersonPageState();
}

class _SearchPersonPageState extends State<SearchPersonPage> {
  List<AppUser> _appUsers = [];
  bool isLoading = true;

  void setLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result =
          await PersonRepository.fetchSearchedPersons(widget.searchWord);
      setState(() {
        _appUsers = result;
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
    if (_appUsers.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return UserListView(appUsers: _appUsers);
  }
}
