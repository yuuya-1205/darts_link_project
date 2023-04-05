import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/views/components/circle/circle_list_item_view.dart';
import 'package:flutter/material.dart';

class CircleListView extends StatelessWidget {
  const CircleListView({required this.circles, Key? key}) : super(key: key);
  final List<Circle> circles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: circles.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 16 : 0, bottom: 16),
          child: CircleListItemView(circle: circles[index]),
        );
      },
    );
  }
}
