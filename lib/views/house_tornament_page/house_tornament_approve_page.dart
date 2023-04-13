import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_join_request.dart';
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
    ;
  }
}
