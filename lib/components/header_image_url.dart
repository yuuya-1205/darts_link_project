import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HeaderImageUrl extends StatelessWidget {
  const HeaderImageUrl({
    Key? key,
    required this.asset,
    required this.headerImageUrl,
  }) : super(key: key);

  final Asset? asset;
  final String headerImageUrl;

  @override
  Widget build(BuildContext context) {
    if (asset != null) {
      return AssetThumb(
        //TODO デザイン次第でアスペクト比変更
        asset: asset!,
        width: 500,
        height: 500,
      );
    } else if (headerImageUrl.isNotEmpty) {
      return Image.network(headerImageUrl, fit: BoxFit.cover);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(FeatherIcons.camera),
          Text(
            'タップして写真を選択しましょう',
            style: TextStyle(
              color: Color.fromRGBO(247, 63, 150, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('＊写真は１枚選択できます'),
          Text('ファイル形式はjpg/png'),
        ],
      );
    }
  }
}
