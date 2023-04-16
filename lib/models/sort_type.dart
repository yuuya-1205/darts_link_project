import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

enum SortType {
  area(
    'エリア',
    OriginalTheme.areaLightColor,
    OriginalTheme.primary,
    Icons.location_pin,
  ),
  date(
    '日付',
    OriginalTheme.dateLightColor,
    OriginalTheme.dateDarkColor,
    Icons.calendar_month_outlined,
  ),
  genre(
    '種目',
    OriginalTheme.genreLightColor,
    OriginalTheme.genreDarkColor,
    Icons.location_pin,
  ),
  feature(
    '特徴',
    OriginalTheme.featureLightColor,
    OriginalTheme.featureDarkColor,
    Icons.calendar_month_outlined,
  ),
  isOpen(
    '募集中',
    OriginalTheme.isOpenLightColor,
    OriginalTheme.isOpenDarkColor,
    Icons.location_pin,
  );

  const SortType(this.title, this.lightColor, this.darkColor, this.icon);
  final String title;
  final Color lightColor;
  final Color darkColor;
  final IconData icon;
}
