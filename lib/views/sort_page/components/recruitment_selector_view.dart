import 'package:flutter/material.dart';

import 'sort_page_selector_frame.dart';

class RecruitmentSelectorView extends StatelessWidget {
  const RecruitmentSelectorView({
    Key? key,
    required this.isRecruitment,
    this.onChanged,
  }) : super(key: key);
  final bool? isRecruitment;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SortPageSelectorFrame(
      title: '募集中',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('現在募集中のものだけ表示する'),
            Checkbox(
              value: isRecruitment ?? false,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
