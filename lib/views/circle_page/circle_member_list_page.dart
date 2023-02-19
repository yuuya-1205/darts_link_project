import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/circle/circle_member.dart';
import 'package:darts_link_project/repositories/circle/circle_member_repository.dart';
import 'package:darts_link_project/views/circle_page/circle_member_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleMemberListPage extends StatefulWidget {
  const CircleMemberListPage({
    Key? key,
    required this.circle,
  }) : super(key: key);

  final Circle circle;

  @override
  State<CircleMemberListPage> createState() => _CircleMemberListPageState();
}

class _CircleMemberListPageState extends State<CircleMemberListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          // ignore: prefer_const_literals_to_create_immutables
          child: Row(children: [
            const SizedBox(
              width: 30,
              child: BackButton(),
            ),
            const Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'メンバーリスト',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<CircleMember>>(
          stream: CircleMemberRepository.circleMemberListStream(
            circleId: widget.circle.circleId,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Container();
            }
            final circleMembers = snapshot.data;
            if (circleMembers!.isEmpty) {
              return const Center(
                child: Text('まだ、メンバーがいません'),
              );
            }

            return ListView.builder(
                itemCount: circleMembers.length,
                itemBuilder: (context, index) {
                  final circleMember = circleMembers[index];
                  return CircleMemberListCard(
                    circleMember: circleMember,
                  );
                });
          }),
    );
  }
}
