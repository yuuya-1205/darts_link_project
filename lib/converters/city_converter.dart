import 'package:darts_link_project/models/city.dart';
import 'package:json_annotation/json_annotation.dart';

class CityNonNullableConverter
    implements JsonConverter<City, Map<String, dynamic>> {
  const CityNonNullableConverter();

  @override
  City fromJson(Map<String, dynamic> json) {
    return City.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(City city) {
    return city.toJson();
  }
}

class CityNullableConverter
    implements JsonConverter<City?, Map<String, dynamic>?> {
  const CityNullableConverter();

  @override
  City? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return City.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(City? city) {
    return city?.toJson();
  }
}
