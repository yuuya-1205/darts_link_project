import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    this.size = 50,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);
  final String? imageUrl;
  final double? size;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: size,
          height: size,
          child: ClipOval(
            child: imageUrl == ''
                ? Container(
                    color: Colors.grey,
                    child: const Icon(
                      FeatherIcons.user,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
          )),
    );
  }
}
