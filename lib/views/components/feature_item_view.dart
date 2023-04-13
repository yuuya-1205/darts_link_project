import 'package:flutter/material.dart';

import '../../models/tag_type.dart';

class FeatureItemView extends StatelessWidget {
  const FeatureItemView(
      {Key? key, required this.isSelected, required this.type})
      : super(key: key);
  final bool isSelected;
  final FeatureTagType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(242, 246, 217, 1)
              : const Color.fromRGBO(251, 251, 251, 1),
          border: Border.all(
            color: isSelected
                ? const Color.fromRGBO(189, 208, 66, 1)
                : const Color.fromRGBO(217, 217, 217, 1),
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        type.label,
        style: TextStyle(
          color: isSelected
              ? const Color.fromRGBO(189, 208, 66, 1)
              : const Color.fromRGBO(217, 217, 217, 1),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
