// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SortState _$SortStateFromJson(Map<String, dynamic> json) {
  return _SortState.fromJson(json);
}

/// @nodoc
mixin _$SortState {
  Pref? get pref => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get isRecruitment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SortStateCopyWith<SortState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortStateCopyWith<$Res> {
  factory $SortStateCopyWith(SortState value, $Res Function(SortState) then) =
      _$SortStateCopyWithImpl<$Res, SortState>;
  @useResult
  $Res call({Pref? pref, City? city, DateTime? date, bool isRecruitment});

  $PrefCopyWith<$Res>? get pref;
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$SortStateCopyWithImpl<$Res, $Val extends SortState>
    implements $SortStateCopyWith<$Res> {
  _$SortStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pref = freezed,
    Object? city = freezed,
    Object? date = freezed,
    Object? isRecruitment = null,
  }) {
    return _then(_value.copyWith(
      pref: freezed == pref
          ? _value.pref
          : pref // ignore: cast_nullable_to_non_nullable
              as Pref?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecruitment: null == isRecruitment
          ? _value.isRecruitment
          : isRecruitment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrefCopyWith<$Res>? get pref {
    if (_value.pref == null) {
      return null;
    }

    return $PrefCopyWith<$Res>(_value.pref!, (value) {
      return _then(_value.copyWith(pref: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SortStateCopyWith<$Res> implements $SortStateCopyWith<$Res> {
  factory _$$_SortStateCopyWith(
          _$_SortState value, $Res Function(_$_SortState) then) =
      __$$_SortStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pref? pref, City? city, DateTime? date, bool isRecruitment});

  @override
  $PrefCopyWith<$Res>? get pref;
  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$_SortStateCopyWithImpl<$Res>
    extends _$SortStateCopyWithImpl<$Res, _$_SortState>
    implements _$$_SortStateCopyWith<$Res> {
  __$$_SortStateCopyWithImpl(
      _$_SortState _value, $Res Function(_$_SortState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pref = freezed,
    Object? city = freezed,
    Object? date = freezed,
    Object? isRecruitment = null,
  }) {
    return _then(_$_SortState(
      pref: freezed == pref
          ? _value.pref
          : pref // ignore: cast_nullable_to_non_nullable
              as Pref?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecruitment: null == isRecruitment
          ? _value.isRecruitment
          : isRecruitment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SortState implements _SortState {
  const _$_SortState(
      {this.pref, this.city, this.date, this.isRecruitment = false});

  factory _$_SortState.fromJson(Map<String, dynamic> json) =>
      _$$_SortStateFromJson(json);

  @override
  final Pref? pref;
  @override
  final City? city;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool isRecruitment;

  @override
  String toString() {
    return 'SortState(pref: $pref, city: $city, date: $date, isRecruitment: $isRecruitment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortState &&
            (identical(other.pref, pref) || other.pref == pref) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRecruitment, isRecruitment) ||
                other.isRecruitment == isRecruitment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pref, city, date, isRecruitment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortStateCopyWith<_$_SortState> get copyWith =>
      __$$_SortStateCopyWithImpl<_$_SortState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SortStateToJson(
      this,
    );
  }
}

abstract class _SortState implements SortState {
  const factory _SortState(
      {final Pref? pref,
      final City? city,
      final DateTime? date,
      final bool isRecruitment}) = _$_SortState;

  factory _SortState.fromJson(Map<String, dynamic> json) =
      _$_SortState.fromJson;

  @override
  Pref? get pref;
  @override
  City? get city;
  @override
  DateTime? get date;
  @override
  bool get isRecruitment;
  @override
  @JsonKey(ignore: true)
  _$$_SortStateCopyWith<_$_SortState> get copyWith =>
      throw _privateConstructorUsedError;
}
