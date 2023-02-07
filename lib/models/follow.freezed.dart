// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Follow _$FollowFromJson(Map<String, dynamic> json) {
  return _Follow.fromJson(json);
}

/// @nodoc
mixin _$Follow {
  String get followingUid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowCopyWith<Follow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowCopyWith<$Res> {
  factory $FollowCopyWith(Follow value, $Res Function(Follow) then) =
      _$FollowCopyWithImpl<$Res, Follow>;
  @useResult
  $Res call(
      {String followingUid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$FollowCopyWithImpl<$Res, $Val extends Follow>
    implements $FollowCopyWith<$Res> {
  _$FollowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingUid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      followingUid: null == followingUid
          ? _value.followingUid
          : followingUid // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_FollowCopyWith<$Res> implements $FollowCopyWith<$Res> {
  factory _$$_FollowCopyWith(_$_Follow value, $Res Function(_$_Follow) then) =
      __$$_FollowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String followingUid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_FollowCopyWithImpl<$Res>
    extends _$FollowCopyWithImpl<$Res, _$_Follow>
    implements _$$_FollowCopyWith<$Res> {
  __$$_FollowCopyWithImpl(_$_Follow _value, $Res Function(_$_Follow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingUid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Follow(
      followingUid: null == followingUid
          ? _value.followingUid
          : followingUid // ignore: cast_nullable_to_non_nullable
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
class _$_Follow implements _Follow {
  const _$_Follow(
      {required this.followingUid,
      required this.userName,
      required this.userId,
      required this.userImage,
      @TimestampConverter() required this.createdAt});

  factory _$_Follow.fromJson(Map<String, dynamic> json) =>
      _$$_FollowFromJson(json);

  @override
  final String followingUid;
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
    return 'Follow(followingUid: $followingUid, userName: $userName, userId: $userId, userImage: $userImage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Follow &&
            (identical(other.followingUid, followingUid) ||
                other.followingUid == followingUid) &&
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
      runtimeType, followingUid, userName, userId, userImage, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowCopyWith<_$_Follow> get copyWith =>
      __$$_FollowCopyWithImpl<_$_Follow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowToJson(
      this,
    );
  }
}

abstract class _Follow implements Follow {
  const factory _Follow(
      {required final String followingUid,
      required final String userName,
      required final String userId,
      required final String userImage,
      @TimestampConverter() required final Timestamp createdAt}) = _$_Follow;

  factory _Follow.fromJson(Map<String, dynamic> json) = _$_Follow.fromJson;

  @override
  String get followingUid;
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
  _$$_FollowCopyWith<_$_Follow> get copyWith =>
      throw _privateConstructorUsedError;
}
