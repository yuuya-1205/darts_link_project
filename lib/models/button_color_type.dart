import 'package:flutter/material.dart';

import '../theme_data.dart';

enum ButtonColorType {
  white(Colors.white, OriginalTheme.primary),
  material(OriginalTheme.primary, Colors.white);

  const ButtonColorType(this.primary, this.onPrimary);
  final Color primary;
  final Color onPrimary;
}
