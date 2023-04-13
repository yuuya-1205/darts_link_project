import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/views/components/feature_item_view.dart';
import 'package:darts_link_project/views/sort_page/components/sort_page_selector_frame.dart';
import 'package:flutter/material.dart';

class FeatureSelectorView extends StatelessWidget {
  const FeatureSelectorView({
    Key? key,
    required this.selectedFeatures,
    required this.onSelectFeature,
  }) : super(key: key);

  final List<FeatureTagType>? selectedFeatures;
  final ValueChanged<FeatureTagType> onSelectFeature;

  @override
  Widget build(BuildContext context) {
    return SortPageSelectorFrame(
      title: '特徴',
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: FeatureTagType.values
              .map((type) => GestureDetector(
                  onTap: () => onSelectFeature.call(type),
                  child: FeatureItemView(
                      isSelected: selectedFeatures?.contains(type) ?? false,
                      type: type)))
              .toList(),
        )
      ],
    );
  }
}
