import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/circle.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/circle_page/circle_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CircleCardPage extends StatelessWidget {
  const CircleCardPage({
    Key? key,
    required this.circle,
  }) : super(key: key);

  final Circle circle;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM月dd日");
    DateFormat timeFormat = DateFormat("HH:mm");
    return GestureDetector(
      onTap: () async {
        // final _profile = await UserRepository.fetchUser(circle.ownerId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CircleDetailPage(
                  circle: circle,
                )),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(232, 232, 232, 1))),
          height: 110,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 23, 0, 23),
                child: UserImage(
                    height: 64,
                    width: 64,
                    imageUrl: circle.createrImage,
                    uid: circle.ownerId),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 14, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      circle.circleName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color.fromRGBO(210, 48, 125, 1),
                        ),
                        // Text(
                        //   circle.place,
                        //   style: const TextStyle(
                        //       color: Color.fromRGBO(210, 48, 125, 1)),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${circle.numberOfParticipants}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: OriginalTheme.themeData.primaryColor,
                      ),
                    ),
                    Text(
                      '/' '${circle.capacity}人',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: OriginalTheme.themeData.disabledColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
