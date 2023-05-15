import 'package:darts_link_project/components/user_image.dart';
import 'package:flutter/material.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserImage(
        imageUrl: imageUrl,
      ),
      title: Text(name),
    );
  }
}
