import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/house_tornament_page/house_tornament_join_request_card.dart';
import 'package:flutter/material.dart';

class HouseTornamentApprovePage extends StatefulWidget {
  const HouseTornamentApprovePage({super.key, required this.houseTournament});

  final HouseTournament houseTournament;

  @override
  State<HouseTornamentApprovePage> createState() =>
      _HouseTornamentApprovePageState();
}

class _HouseTornamentApprovePageState extends State<HouseTornamentApprovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OriginalAppBer(title: '申請リスト'),
      body: StreamBuilder<List<HouseTornamentJoinRequest>>(
          stream: HouseTornamentJoinRequestRepository
              .houseTornamentJoinRequestListStream(
                  houseTornamentId: widget.houseTournament.houseTournamentId),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Container();
            }
            final houseTornamentJoinRequests = snapshot.data;
            if (houseTornamentJoinRequests!.isEmpty) {
              return const Center(
                child: Text('まだ、申請者がいません'),
              );
            }

            return ListView.builder(
                itemCount: houseTornamentJoinRequests.length,
                itemBuilder: (context, index) {
                  final houseTornamentJoinRequest =
                      houseTornamentJoinRequests[index];
                  return HouseTornamentJoinRequestCard(
                      houseTornamentJoinRequest: houseTornamentJoinRequest);
                });
          }),
    );
  }
}
