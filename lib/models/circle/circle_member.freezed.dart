// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CircleMember _$CircleMemberFromJson(Map<String, dynamic> json) {
  return _CircleMember.fromJson(json);
}

/// @nodoc
mixin _$CircleMember {
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleMemberCopyWith<CircleMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleMemberCopyWith<$Res> {
  factory $CircleMemberCopyWith(
          CircleMember value, $Res Function(CircleMember) then) =
      _$CircleMemberCopyWithImpl<$Res, CircleMember>;
  @useResult
  $Res call(
      {String uid,
      String userName,
      String userId,
      String userImage,
      int followerCount,
      int followingCount,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class _$CircleMemberCopyWithImpl<$Res, $Val extends CircleMember>
    implements $CircleMemberCopyWith<$Res> {
  _$CircleMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CircleMemberCopyWith<$Res>
    implements $CircleMemberCopyWith<$Res> {
  factory _$$_CircleMemberCopyWith(
          _$_CircleMember value, $Res Function(_$_CircleMember) then) =
      __$$_CircleMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String userName,
      String userId,
      String userImage,
      int followerCount,
      int followingCount,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class __$$_CircleMemberCopyWithImpl<$Res>
    extends _$CircleMemberCopyWithImpl<$Res, _$_CircleMember>
    implements _$$_CircleMemberCopyWith<$Res> {
  __$$_CircleMemberCopyWithImpl(
      _$_CircleMember _value, $Res Function(_$_CircleMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? joinedAt = null,
  }) {
    return _then(_$_CircleMember(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CircleMember implements _CircleMember {
  const _$_CircleMember(
      {required this.uid,
      required this.userName,
      required this.userId,
      required this.userImage,
      required this.followerCount,
      required this.followingCount,
      @TimestampConverter() required this.joinedAt});

  factory _$_CircleMember.fromJson(Map<String, dynamic> json) =>
      _$$_CircleMemberFromJson(json);

  @override
  final String uid;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  final int followerCount;
  @override
  final int followingCount;
  @override
  @TimestampConverter()
  final Timestamp joinedAt;

  @override
  String toString() {
    return 'CircleMember(uid: $uid, userName: $userName, userId: $userId, userImage: $userImage, followerCount: $followerCount, followingCount: $followingCount, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CircleMember &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, userName, userId, userImage,
      followerCount, followingCount, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CircleMemberCopyWith<_$_CircleMember> get copyWith =>
      __$$_CircleMemberCopyWithImpl<_$_CircleMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CircleMemberToJson(
      this,
    );
  }
}

abstract class _CircleMember implements CircleMember {
  const factory _CircleMember(
          {required final String uid,
          required final String userName,
          required final String userId,
          required final String userImage,
          required final int followerCount,
          required final int followingCount,
          @TimestampConverter() required final Timestamp joinedAt}) =
      _$_CircleMember;

  factory _CircleMember.fromJson(Map<String, dynamic> json) =
      _$_CircleMember.fromJson;

  @override
  String get uid;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  int get followerCount;
  @override
  int get followingCount;
  @override
  @TimestampConverter()
  Timestamp get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CircleMemberCopyWith<_$_CircleMember> get copyWith =>
      throw _privateConstructorUsedError;
}
