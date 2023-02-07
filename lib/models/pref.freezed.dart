// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pref _$PrefFromJson(Map<String, dynamic> json) {
  return _Pref.fromJson(json);
}

/// @nodoc
mixin _$Pref {
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrefCopyWith<Pref> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrefCopyWith<$Res> {
  factory $PrefCopyWith(Pref value, $Res Function(Pref) then) =
      _$PrefCopyWithImpl<$Res, Pref>;
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class _$PrefCopyWithImpl<$Res, $Val extends Pref>
    implements $PrefCopyWith<$Res> {
  _$PrefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrefCopyWith<$Res> implements $PrefCopyWith<$Res> {
  factory _$$_PrefCopyWith(_$_Pref value, $Res Function(_$_Pref) then) =
      __$$_PrefCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String name});
}

/// @nodoc
class __$$_PrefCopyWithImpl<$Res> extends _$PrefCopyWithImpl<$Res, _$_Pref>
    implements _$$_PrefCopyWith<$Res> {
  __$$_PrefCopyWithImpl(_$_Pref _value, $Res Function(_$_Pref) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_Pref(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pref implements _Pref {
  const _$_Pref({required this.code, required this.name});

  factory _$_Pref.fromJson(Map<String, dynamic> json) => _$$_PrefFromJson(json);

  @override
  final int code;
  @override
  final String name;

  @override
  String toString() {
    return 'Pref(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pref &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrefCopyWith<_$_Pref> get copyWith =>
      __$$_PrefCopyWithImpl<_$_Pref>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrefToJson(
      this,
    );
  }
}

abstract class _Pref implements Pref {
  const factory _Pref({required final int code, required final String name}) =
      _$_Pref;

  factory _Pref.fromJson(Map<String, dynamic> json) = _$_Pref.fromJson;

  @override
  int get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PrefCopyWith<_$_Pref> get copyWith => throw _privateConstructorUsedError;
}
