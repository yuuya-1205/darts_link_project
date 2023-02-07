import 'package:freezed_annotation/freezed_annotation.dart';

part 'pref.freezed.dart';
part 'pref.g.dart';

@freezed
class Pref with _$Pref {
  const factory Pref({
    required int code,
    required String name,
  }) = _Pref;

  factory Pref.fromJson(Map<String, dynamic> json) => _$PrefFromJson(json);
}
