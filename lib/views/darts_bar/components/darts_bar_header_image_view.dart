import 'package:darts_link_project/components/header_image_url.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DartsBarHeaderImageView extends StatelessWidget {
  const DartsBarHeaderImageView({
    Key? key,
    this.asset,
    required this.headerImage,
    this.height = 200,
  }) : super(key: key);
  final Asset? asset;
  final String headerImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: double.infinity,
          child: HeaderImageUrl(
            asset: asset,
            headerImageUrl: headerImage,
          ),
        ),
        Container(
          height: height,
          width: double.infinity,
          color: Colors.white.withOpacity(0.15),
        )
      ],
    );
  }
}
