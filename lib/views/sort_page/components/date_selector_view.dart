import 'package:darts_link_project/extensions/build_context_extension.dart';
import 'package:darts_link_project/extensions/date_time_extension.dart';
import 'package:darts_link_project/views/sort_page/components/sort_page_selector_frame.dart';
import 'package:flutter/material.dart';

import 'selector_input_frame.dart';

class DateSelectorView extends StatelessWidget {
  const DateSelectorView({
    Key? key,
    this.selectedDateTime,
    required this.onSubmitDateSelector,
  }) : super(key: key);
  final DateTime? selectedDateTime;
  final ValueChanged<DateTime> onSubmitDateSelector;

  @override
  Widget build(BuildContext context) {
    return SortPageSelectorFrame(
      title: '日程指定',
      children: [
        SelectorInputFrame(
          title: '日程を指定する',
          value: selectedDateTime?.formatYMDKey,
          onTap: () {
            context
                .showDateSelectorPicker(
              selectedDateTime ?? DateTime.now(),
            )
                .then((value) {
              if (value == null) return;
              onSubmitDateSelector.call(value);
            });
          },
        ),
      ],
    );
  }
}
