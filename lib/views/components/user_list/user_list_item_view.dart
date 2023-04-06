import 'package:darts_link_project/models/app_user.dart';
import 'package:flutter/material.dart';

class UserListItemView extends StatelessWidget {
  const UserListItemView({required this.user, Key? key}) : super(key: key);
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 30,
                foregroundImage: user.userImage.isEmpty
                    ? null
                    : NetworkImage(user.userImage),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text('@${user.userId}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 0),
      ],
    );
  }
}
