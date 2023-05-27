import 'package:flutter/material.dart';

import 'constant/color.dart';

class OriginalTheme {
  static final themeData = ThemeData(
      primaryColor: primary,
      disabledColor: grey,
      dividerColor: const Color.fromRGBO(240, 242, 247, 1));

  static const primary = Color.fromRGBO(247, 63, 150, 1);
  static const areaLightColor = Color.fromRGBO(255, 222, 238, 1);
  static const dateLightColor = Color.fromRGBO(242, 246, 217, 1);
  static const dateDarkColor = Color.fromRGBO(189, 208, 66, 1);
  static const genreLightColor = Color.fromRGBO(227, 243, 255, 1);
  static const genreDarkColor = Color.fromRGBO(78, 165, 229, 1);
  static const featureLightColor = Color.fromRGBO(242, 246, 217, 1);
  static const featureDarkColor = Color.fromRGBO(189, 208, 66, 1);
  static const isOpenLightColor = Color.fromRGBO(255, 251, 211, 1);
  static const isOpenDarkColor = Color.fromRGBO(223, 211, 0, 1);
}
