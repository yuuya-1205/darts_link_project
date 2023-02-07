import 'package:darts_link_project/models/pref.dart';
import 'package:json_annotation/json_annotation.dart';

class PrefNonNullableConverter
    implements JsonConverter<Pref, Map<String, dynamic>> {
  const PrefNonNullableConverter();

  @override
  Pref fromJson(Map<String, dynamic> json) {
    return Pref.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Pref pref) {
    return pref.toJson();
  }
}

class PrefNullableConverter
    implements JsonConverter<Pref?, Map<String, dynamic>?> {
  const PrefNullableConverter();

  @override
  Pref? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Pref.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Pref? pref) {
    return pref?.toJson();
  }
}
