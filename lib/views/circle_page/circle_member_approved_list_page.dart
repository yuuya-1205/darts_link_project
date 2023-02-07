import 'package:darts_link_project/models/circle.dart';
import 'package:darts_link_project/models/circle_join_request.dart';
import 'package:darts_link_project/repositories/circle/circle_join_request_repository.dart';
import 'package:darts_link_project/views/circle_page/circle_join_request_list_card.dart';
import 'package:flutter/material.dart';

class CircleMemberApprovedListPage extends StatefulWidget {
  const CircleMemberApprovedListPage({
    Key? key,
    required this.circle,
  }) : super(key: key);
  final Circle circle;

  @override
  State<CircleMemberApprovedListPage> createState() =>
      _CircleMemberApprovedListPageState();
}

class _CircleMemberApprovedListPageState
    extends State<CircleMemberApprovedListPage> {
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
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
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
          '申請リスト',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<CircleJoinRequest>>(
          stream: CircleJoinRequestRepository.circleJoinRequestListStream(
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
            final circleJoinRequests = snapshot.data;
            if (circleJoinRequests!.isEmpty) {
              return const Center(
                child: Text('まだ、投稿がありません'),
              );
            }

            return ListView.builder(
                itemCount: circleJoinRequests.length,
                itemBuilder: (context, index) {
                  final circleJoinRequest = circleJoinRequests[index];
                  return CircleJoinRequestListCard(
                      circleJoinRequest: circleJoinRequest);
                });
          }),
    );
  }
}
