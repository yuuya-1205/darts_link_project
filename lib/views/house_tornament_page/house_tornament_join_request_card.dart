import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament_join_request.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class HouseTornamentJoinRequestCard extends StatefulWidget {
  const HouseTornamentJoinRequestCard(
      {super.key, required this.houseTornamentJoinRequest});
  final HouseTornamentJoinRequest houseTornamentJoinRequest;

  @override
  State<HouseTornamentJoinRequestCard> createState() =>
      _HouseTornamentJoinRequestCardState();
}

class _HouseTornamentJoinRequestCardState
    extends State<HouseTornamentJoinRequestCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(232, 232, 232, 1))),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserImage(
                      imageUrl: widget.houseTornamentJoinRequest.userImage),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.houseTornamentJoinRequest.userName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.houseTornamentJoinRequest.userId,
                              style: TextStyle(
                                  color: OriginalTheme.themeData.disabledColor),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            // Text(
                            //   'フォロー${circleJoinRequest.followingCount}',
                            //   style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            // const Text('/'),
                            // Text(
                            //   'フォロワー${circleJoinRequest.followerCount}',
                            //   style:
                            //       const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FollowApproveButton(
                    onPressed: () {},
                    text: '許可',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FollowApproveButton(
                    onPressed: () {
                      //   CircleJoinRequestRepository.deleteCircleJoinRequest(circleId: circleId, uid: uid)
                    },
                    text: '拒否',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
