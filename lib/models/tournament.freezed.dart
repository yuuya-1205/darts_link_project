// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  return _Tournament.fromJson(json);
}

/// @nodoc
mixin _$Tournament {
  String get title => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get creatorRef =>
      throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  int get teamCounts => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  ///クライアントで使用するデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentCopyWith<Tournament> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentCopyWith<$Res> {
  factory $TournamentCopyWith(
          Tournament value, $Res Function(Tournament) then) =
      _$TournamentCopyWithImpl<$Res, Tournament>;
  @useResult
  $Res call(
      {String title,
      @DocumentReferenceConverter() DocumentReference<Object?> creatorRef,
      String creatorName,
      int teamCounts,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class _$TournamentCopyWithImpl<$Res, $Val extends Tournament>
    implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? creatorRef = null,
    Object? creatorName = null,
    Object? teamCounts = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
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
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TournamentCopyWith<$Res>
    implements $TournamentCopyWith<$Res> {
  factory _$$_TournamentCopyWith(
          _$_Tournament value, $Res Function(_$_Tournament) then) =
      __$$_TournamentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @DocumentReferenceConverter() DocumentReference<Object?> creatorRef,
      String creatorName,
      int teamCounts,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class __$$_TournamentCopyWithImpl<$Res>
    extends _$TournamentCopyWithImpl<$Res, _$_Tournament>
    implements _$$_TournamentCopyWith<$Res> {
  __$$_TournamentCopyWithImpl(
      _$_Tournament _value, $Res Function(_$_Tournament) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? creatorRef = null,
    Object? creatorName = null,
    Object? teamCounts = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reference = freezed,
  }) {
    return _then(_$_Tournament(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      creatorRef: null == creatorRef
          ? _value.creatorRef
          : creatorRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
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
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tournament implements _Tournament {
  const _$_Tournament(
      {this.title = '未設定',
      @DocumentReferenceConverter() required this.creatorRef,
      required this.creatorName,
      this.teamCounts = 2,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @DocumentReferenceConverter() this.reference});

  factory _$_Tournament.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> creatorRef;
  @override
  final String creatorName;
  @override
  @JsonKey()
  final int teamCounts;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  ///クライアントで使用するデータ
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? reference;

  @override
  String toString() {
    return 'Tournament(title: $title, creatorRef: $creatorRef, creatorName: $creatorName, teamCounts: $teamCounts, createdAt: $createdAt, updatedAt: $updatedAt, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tournament &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.creatorRef, creatorRef) ||
                other.creatorRef == creatorRef) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.teamCounts, teamCounts) ||
                other.teamCounts == teamCounts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, creatorRef, creatorName,
      teamCounts, createdAt, updatedAt, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TournamentCopyWith<_$_Tournament> get copyWith =>
      __$$_TournamentCopyWithImpl<_$_Tournament>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentToJson(
      this,
    );
  }
}

abstract class _Tournament implements Tournament {
  const factory _Tournament(
      {final String title,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> creatorRef,
      required final String creatorName,
      final int teamCounts,
      @TimestampConverter()
          required final Timestamp createdAt,
      @TimestampConverter()
          required final Timestamp updatedAt,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? reference}) = _$_Tournament;

  factory _Tournament.fromJson(Map<String, dynamic> json) =
      _$_Tournament.fromJson;

  @override
  String get title;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get creatorRef;
  @override
  String get creatorName;
  @override
  int get teamCounts;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override

  ///クライアントで使用するデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference;
  @override
  @JsonKey(ignore: true)
  _$$_TournamentCopyWith<_$_Tournament> get copyWith =>
      throw _privateConstructorUsedError;
}
