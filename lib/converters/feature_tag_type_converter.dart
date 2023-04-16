import 'package:darts_link_project/models/tag_type.dart';
import 'package:json_annotation/json_annotation.dart';

class FeatureTagTypeConverter implements JsonConverter<FeatureTagType, String> {
  const FeatureTagTypeConverter();

  @override
  FeatureTagType fromJson(String label) {
    return FeatureTagType.fromLabel(label);
  }

  @override
  String toJson(FeatureTagType tagType) {
    return tagType.label;
  }
}
