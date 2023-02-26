// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_robin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoundRobin _$RoundRobinFromJson(Map<String, dynamic> json) {
  return _RoundRobin.fromJson(json);
}

/// @nodoc
mixin _$RoundRobin {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get creatorRef =>
      throw _privateConstructorUsedError;
  String get createrName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get teamCounts => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoundRobinCopyWith<RoundRobin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundRobinCopyWith<$Res> {
  factory $RoundRobinCopyWith(
          RoundRobin value, $Res Function(RoundRobin) then) =
      _$RoundRobinCopyWithImpl<$Res, RoundRobin>;
  @useResult
  $Res call(
      {String title,
      String id,
      @DocumentReferenceConverter() DocumentReference<Object?> creatorRef,
      String createrName,
      String userId,
      int teamCounts,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class _$RoundRobinCopyWithImpl<$Res, $Val extends RoundRobin>
    implements $RoundRobinCopyWith<$Res> {
  _$RoundRobinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? creatorRef = null,
    Object? createrName = null,
    Object? userId = null,
    Object? teamCounts = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createrName: null == createrName
          ? _value.createrName
          : createrName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamCounts: null == teamCounts
          ? _value.teamCounts
          : teamCounts // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_RoundRobinCopyWith<$Res>
    implements $RoundRobinCopyWith<$Res> {
  factory _$$_RoundRobinCopyWith(
          _$_RoundRobin value, $Res Function(_$_RoundRobin) then) =
      __$$_RoundRobinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String id,
      @DocumentReferenceConverter() DocumentReference<Object?> creatorRef,
      String createrName,
      String userId,
      int teamCounts,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$_RoundRobinCopyWithImpl<$Res>
    extends _$RoundRobinCopyWithImpl<$Res, _$_RoundRobin>
    implements _$$_RoundRobinCopyWith<$Res> {
  __$$_RoundRobinCopyWithImpl(
      _$_RoundRobin _value, $Res Function(_$_RoundRobin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? creatorRef = null,
    Object? createrName = null,
    Object? userId = null,
    Object? teamCounts = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_RoundRobin(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createrName: null == createrName
          ? _value.createrName
          : createrName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      teamCounts: null == teamCounts
          ? _value.teamCounts
          : teamCounts // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_RoundRobin implements _RoundRobin {
  const _$_RoundRobin(
      {this.title = '未設定',
      this.id = '',
      @DocumentReferenceConverter() required this.creatorRef,
      required this.createrName,
      required this.userId,
      this.teamCounts = 1,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$_RoundRobin.fromJson(Map<String, dynamic> json) =>
      _$$_RoundRobinFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String id;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> creatorRef;
  @override
  final String createrName;
  @override
  final String userId;
  @override
  @JsonKey()
  final int teamCounts;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'RoundRobin(title: $title, id: $id, creatorRef: $creatorRef, createrName: $createrName, userId: $userId, teamCounts: $teamCounts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoundRobin &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorRef, creatorRef) ||
                other.creatorRef == creatorRef) &&
            (identical(other.createrName, createrName) ||
                other.createrName == createrName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.teamCounts, teamCounts) ||
                other.teamCounts == teamCounts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, id, creatorRef,
      createrName, userId, teamCounts, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoundRobinCopyWith<_$_RoundRobin> get copyWith =>
      __$$_RoundRobinCopyWithImpl<_$_RoundRobin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoundRobinToJson(
      this,
    );
  }
}

abstract class _RoundRobin implements RoundRobin {
  const factory _RoundRobin(
      {final String title,
      final String id,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> creatorRef,
      required final String createrName,
      required final String userId,
      final int teamCounts,
      @TimestampConverter()
          required final Timestamp createdAt,
      @TimestampConverter()
          required final Timestamp updatedAt}) = _$_RoundRobin;

  factory _RoundRobin.fromJson(Map<String, dynamic> json) =
      _$_RoundRobin.fromJson;

  @override
  String get title;
  @override
  String get id;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get creatorRef;
  @override
  String get createrName;
  @override
  String get userId;
  @override
  int get teamCounts;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_RoundRobinCopyWith<_$_RoundRobin> get copyWith =>
      throw _privateConstructorUsedError;
}
