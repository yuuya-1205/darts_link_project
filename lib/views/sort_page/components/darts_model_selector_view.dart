import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/views/components/selector_container_view.dart';
import 'package:darts_link_project/views/sort_page/components/sort_page_selector_frame.dart';
import 'package:flutter/material.dart';

class DartsModelSelectorView extends StatelessWidget {
  const DartsModelSelectorView({
    Key? key,
    required this.selectedDartsModels,
    required this.onSelectDartsModel,
  }) : super(key: key);

  final List<DartsModelTagType>? selectedDartsModels;
  final ValueChanged<DartsModelTagType> onSelectDartsModel;

  @override
  Widget build(BuildContext context) {
    return SortPageSelectorFrame(
      title: '特徴',
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: DartsModelTagType.values
              .map((type) => GestureDetector(
                  onTap: () => onSelectDartsModel.call(type),
                  child: SelectorContainerView(
                      isSelected: selectedDartsModels?.contains(type) ?? false,
                      label: type.label)))
              .toList(),
        )
      ],
    );
  }
}
