import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:flutter/material.dart';

import '../../models/follow.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key, required this.user}) : super(key: key);
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthRepository.currentUser;

    if (currentUser == null) {
      throw Exception('ログインしてください。');
    }

    return StreamBuilder<Follow>(
        stream: FollowRepository.streamFollow(
            uid: currentUser.id, followingUid: user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const LoadingView();
          }

          return GestureDetector(
            onTap: () {
              if (snapshot.hasData) {
                FollowRepository.unFollowing(
                    uid: currentUser.id, followingUid: user.id);
                return;
              }
              FollowRepository.setFollowing(
                  uid: currentUser.id, follow: Follow.fromAppUser(user));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                snapshot.hasData ? 'フォロー解除' : 'フォローする',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }
}
