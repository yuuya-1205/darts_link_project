import 'package:flutter/material.dart';

import '../views/time_line/follow_time_line_page.dart';
import '../views/time_line/whole_time_line_page.dart';

enum TimeLineTabType {
  all(label: '全体', page: WholeTimeLinePage()),
  following(label: 'フォロー', page: FollowTimeLinePage());

  const TimeLineTabType({
    required this.label,
    required this.page,
  });
  final String label;
  final Widget page;
}
