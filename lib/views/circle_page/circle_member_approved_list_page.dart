import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/circle/circle_join_request.dart';
import 'package:darts_link_project/repositories/circle/circle_join_request_repository.dart';
import 'package:darts_link_project/views/circle_page/circle_join_request_list_card.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
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
      appBar: const OriginalAppBer(title: '申請リスト'),
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
                child: Text('まだ、申請者がいません'),
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
