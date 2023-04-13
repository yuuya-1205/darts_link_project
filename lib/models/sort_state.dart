import 'package:darts_link_project/converters/feature_tag_type_converter.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'pref.dart';

part 'sort_state.freezed.dart';
part 'sort_state.g.dart';

@freezed
class SortState with _$SortState {
  const factory SortState({
    Pref? pref,
    City? city,
    @Freezed(fromJson: true)
    @FeatureTagTypeConverter()
        List<FeatureTagType>? features,
    DateTime? date,
    @Default(false) bool isRecruitment,
  }) = _SortState;

  factory SortState.fromJson(Map<String, dynamic> json) =>
      _$SortStateFromJson(json);
}
