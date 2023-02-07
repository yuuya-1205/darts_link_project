// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Follower _$FollowerFromJson(Map<String, dynamic> json) {
  return _Follower.fromJson(json);
}

/// @nodoc
mixin _$Follower {
  String get followerUid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerCopyWith<Follower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerCopyWith<$Res> {
  factory $FollowerCopyWith(Follower value, $Res Function(Follower) then) =
      _$FollowerCopyWithImpl<$Res, Follower>;
  @useResult
  $Res call(
      {String followerUid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$FollowerCopyWithImpl<$Res, $Val extends Follower>
    implements $FollowerCopyWith<$Res> {
  _$FollowerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followerUid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      followerUid: null == followerUid
          ? _value.followerUid
          : followerUid // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowerCopyWith<$Res> implements $FollowerCopyWith<$Res> {
  factory _$$_FollowerCopyWith(
          _$_Follower value, $Res Function(_$_Follower) then) =
      __$$_FollowerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String followerUid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_FollowerCopyWithImpl<$Res>
    extends _$FollowerCopyWithImpl<$Res, _$_Follower>
    implements _$$_FollowerCopyWith<$Res> {
  __$$_FollowerCopyWithImpl(
      _$_Follower _value, $Res Function(_$_Follower) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followerUid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Follower(
      followerUid: null == followerUid
          ? _value.followerUid
          : followerUid // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Follower implements _Follower {
  const _$_Follower(
      {required this.followerUid,
      required this.userName,
      required this.userId,
      required this.userImage,
      @TimestampConverter() required this.createdAt});

  factory _$_Follower.fromJson(Map<String, dynamic> json) =>
      _$$_FollowerFromJson(json);

  @override
  final String followerUid;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Follower(followerUid: $followerUid, userName: $userName, userId: $userId, userImage: $userImage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Follower &&
            (identical(other.followerUid, followerUid) ||
                other.followerUid == followerUid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, followerUid, userName, userId, userImage, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      __$$_FollowerCopyWithImpl<_$_Follower>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowerToJson(
      this,
    );
  }
}

abstract class _Follower implements Follower {
  const factory _Follower(
      {required final String followerUid,
      required final String userName,
      required final String userId,
      required final String userImage,
      @TimestampConverter() required final Timestamp createdAt}) = _$_Follower;

  factory _Follower.fromJson(Map<String, dynamic> json) = _$_Follower.fromJson;

  @override
  String get followerUid;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      throw _privateConstructorUsedError;
}
