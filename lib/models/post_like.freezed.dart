// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostLike _$PostLikeFromJson(Map<String, dynamic> json) {
  return _PostLike.fromJson(json);
}

/// @nodoc
mixin _$PostLike {
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get likerReference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// クライアントで扱うデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLikeCopyWith<PostLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLikeCopyWith<$Res> {
  factory $PostLikeCopyWith(PostLike value, $Res Function(PostLike) then) =
      _$PostLikeCopyWithImpl<$Res, PostLike>;
  @useResult
  $Res call(
      {String userName,
      String userId,
      String userImage,
      @DocumentReferenceConverter() DocumentReference<Object?>? likerReference,
      @TimestampConverter() Timestamp createdAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class _$PostLikeCopyWithImpl<$Res, $Val extends PostLike>
    implements $PostLikeCopyWith<$Res> {
  _$PostLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? likerReference = freezed,
    Object? createdAt = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      likerReference: freezed == likerReference
          ? _value.likerReference
          : likerReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostLikeCopyWith<$Res> implements $PostLikeCopyWith<$Res> {
  factory _$$_PostLikeCopyWith(
          _$_PostLike value, $Res Function(_$_PostLike) then) =
      __$$_PostLikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String userId,
      String userImage,
      @DocumentReferenceConverter() DocumentReference<Object?>? likerReference,
      @TimestampConverter() Timestamp createdAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class __$$_PostLikeCopyWithImpl<$Res>
    extends _$PostLikeCopyWithImpl<$Res, _$_PostLike>
    implements _$$_PostLikeCopyWith<$Res> {
  __$$_PostLikeCopyWithImpl(
      _$_PostLike _value, $Res Function(_$_PostLike) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? likerReference = freezed,
    Object? createdAt = null,
    Object? reference = freezed,
  }) {
    return _then(_$_PostLike(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      likerReference: freezed == likerReference
          ? _value.likerReference
          : likerReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$_PostLike implements _PostLike {
  const _$_PostLike(
      {required this.userName,
      required this.userId,
      required this.userImage,
      @DocumentReferenceConverter() this.likerReference,
      @TimestampConverter() required this.createdAt,
      @DocumentReferenceConverter() this.reference});

  factory _$_PostLike.fromJson(Map<String, dynamic> json) =>
      _$$_PostLikeFromJson(json);

  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? likerReference;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  /// クライアントで扱うデータ
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? reference;

  @override
  String toString() {
    return 'PostLike(userName: $userName, userId: $userId, userImage: $userImage, likerReference: $likerReference, createdAt: $createdAt, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostLike &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.likerReference, likerReference) ||
                other.likerReference == likerReference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, userId, userImage,
      likerReference, createdAt, reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostLikeCopyWith<_$_PostLike> get copyWith =>
      __$$_PostLikeCopyWithImpl<_$_PostLike>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostLikeToJson(
      this,
    );
  }
}

abstract class _PostLike implements PostLike {
  const factory _PostLike(
      {required final String userName,
      required final String userId,
      required final String userImage,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? likerReference,
      @TimestampConverter()
          required final Timestamp createdAt,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? reference}) = _$_PostLike;

  factory _PostLike.fromJson(Map<String, dynamic> json) = _$_PostLike.fromJson;

  @override
  String get userName;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get likerReference;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override

  /// クライアントで扱うデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference;
  @override
  @JsonKey(ignore: true)
  _$$_PostLikeCopyWith<_$_PostLike> get copyWith =>
      throw _privateConstructorUsedError;
}
