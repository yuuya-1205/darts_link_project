import 'package:darts_link_project/extensions/build_context_extension.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/views/sort_page/components/selector_input_frame.dart';
import 'package:flutter/material.dart';

class AreaSelectorInputView<T> extends StatelessWidget {
  const AreaSelectorInputView({
    required this.title,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.selectedPref,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? value;
  final Pref? selectedPref;
  final ValueChanged<T>? onChanged;
  final VoidCallback? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SelectorInputFrame(
      title: title,
      value: value,
      onTap: () {
        if (onChanged is ValueChanged<Pref>?) {
          context.showAreaSelectorPicker<Pref>(
            onSubmitted: onSubmitted,
            onSelectedItemChanged: onChanged as ValueChanged<Pref>?,
            values: AreaRepository.prefList,
          );
          return;
        }
        if (selectedPref == null) {
          //todo 都道府県を選択してください的なのを出す
          return;
        }
        context.showAreaSelectorPicker<City>(
          onSubmitted: onSubmitted,
          onSelectedItemChanged: onChanged as ValueChanged<City>?,
          values: AreaRepository.cityMap[selectedPref!.code]!,
        );
      },
    );
  }
}
