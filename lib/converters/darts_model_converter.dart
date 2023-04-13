import 'package:darts_link_project/models/tag_type.dart';
import 'package:json_annotation/json_annotation.dart';

class DartsModelTagTypeConverter
    implements JsonConverter<DartsModelTagType, String> {
  const DartsModelTagTypeConverter();

  @override
  DartsModelTagType fromJson(String label) {
    return DartsModelTagType.fromLabel(label);
  }

  @override
  String toJson(DartsModelTagType tagType) {
    return tagType.label;
  }
}
