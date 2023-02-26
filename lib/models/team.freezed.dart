// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  String get teamName => throw _privateConstructorUsedError;
  @Freezed(toJson: true)
  Map<String, bool> get isWin => throw _privateConstructorUsedError;
  @Freezed(toJson: true)
  Map<String, int> get winRegs => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {String id,
      String teamName,
      @Freezed(toJson: true) Map<String, bool> isWin,
      @Freezed(toJson: true) Map<String, int> winRegs,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamName = null,
    Object? isWin = null,
    Object? winRegs = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      isWin: null == isWin
          ? _value.isWin
          : isWin // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      winRegs: null == winRegs
          ? _value.winRegs
          : winRegs // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String teamName,
      @Freezed(toJson: true) Map<String, bool> isWin,
      @Freezed(toJson: true) Map<String, int> winRegs,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res, _$_Team>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamName = null,
    Object? isWin = null,
    Object? winRegs = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Team(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      isWin: null == isWin
          ? _value._isWin
          : isWin // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      winRegs: null == winRegs
          ? _value._winRegs
          : winRegs // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team implements _Team {
  const _$_Team(
      {required this.id,
      required this.teamName,
      @Freezed(toJson: true) final Map<String, bool> isWin = const {},
      @Freezed(toJson: true) final Map<String, int> winRegs = const {},
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _isWin = isWin,
        _winRegs = winRegs;

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final String id;
  @override
  final String teamName;
  final Map<String, bool> _isWin;
  @override
  @JsonKey()
  @Freezed(toJson: true)
  Map<String, bool> get isWin {
    if (_isWin is EqualUnmodifiableMapView) return _isWin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isWin);
  }

  final Map<String, int> _winRegs;
  @override
  @JsonKey()
  @Freezed(toJson: true)
  Map<String, int> get winRegs {
    if (_winRegs is EqualUnmodifiableMapView) return _winRegs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_winRegs);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'Team(id: $id, teamName: $teamName, isWin: $isWin, winRegs: $winRegs, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            const DeepCollectionEquality().equals(other._isWin, _isWin) &&
            const DeepCollectionEquality().equals(other._winRegs, _winRegs) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      teamName,
      const DeepCollectionEquality().hash(_isWin),
      const DeepCollectionEquality().hash(_winRegs),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required final String id,
      required final String teamName,
      @Freezed(toJson: true) final Map<String, bool> isWin,
      @Freezed(toJson: true) final Map<String, int> winRegs,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt}) = _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String get id;
  @override
  String get teamName;
  @override
  @Freezed(toJson: true)
  Map<String, bool> get isWin;
  @override
  @Freezed(toJson: true)
  Map<String, int> get winRegs;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}
