import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/views/components/user_list/user_list_item_view.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({required this.appUsers, Key? key}) : super(key: key);
  final List<AppUser> appUsers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          appUsers.map((appUser) => UserListItemView(user: appUser)).toList(),
    );
  }
}
