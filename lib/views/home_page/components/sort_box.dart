import 'package:darts_link_project/models/sort_type.dart';
import 'package:flutter/material.dart';

class SortBox extends StatelessWidget {
  const SortBox({
    required this.sortType,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final SortType sortType;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: sortType.lightColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: sortType.darkColor),
        ),
        width: 75,
        height: 75,
        child: Column(
          children: [
            const SizedBox(height: 13),
            Icon(
              sortType.icon,
              color: sortType.darkColor,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                sortType.title,
                style: TextStyle(
                  color: sortType.darkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
