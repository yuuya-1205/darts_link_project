import 'package:darts_link_project/models/follow.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/follow_repository.dart';
import 'package:darts_link_project/views/follow_page/follow_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class FollowListPage extends StatefulWidget {
  const FollowListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowListPage> createState() => _FollowListPageState();
}

class _FollowListPageState extends State<FollowListPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser!;

    return StreamBuilder<List<Follow>>(
        stream: FollowRepository.followListStream(uid: user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Container();
          }
          final follows = snapshot.data;
          if (follows!.isEmpty) {
            return const Center(
              child: Text('まだ、フォローがありません'),
            );
          }

          return ListView.builder(
              itemCount: follows.length,
              itemBuilder: (context, index) {
                final follow = follows[index];
                return FollowCard(
                  follow: follow,
                );
              });
        });
  }
}
