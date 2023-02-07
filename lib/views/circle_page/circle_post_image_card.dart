import 'package:darts_link_project/models/post.dart';
import 'package:flutter/material.dart';

class CirclePostImageCard extends StatefulWidget {
  const CirclePostImageCard({Key? key, required this.circlePostImage})
      : super(key: key);

  final Post circlePostImage;

  @override
  State<CirclePostImageCard> createState() => _CirclePostImageCardState();
}

class _CirclePostImageCardState extends State<CirclePostImageCard> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
