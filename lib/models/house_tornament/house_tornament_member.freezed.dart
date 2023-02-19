// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_tornament_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HouseTornamentMember _$HouseTornamentMemberFromJson(Map<String, dynamic> json) {
  return _HouseTornamentMember.fromJson(json);
}

/// @nodoc
mixin _$HouseTornamentMember {
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseTornamentMemberCopyWith<HouseTornamentMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseTornamentMemberCopyWith<$Res> {
  factory $HouseTornamentMemberCopyWith(HouseTornamentMember value,
          $Res Function(HouseTornamentMember) then) =
      _$HouseTornamentMemberCopyWithImpl<$Res, HouseTornamentMember>;
  @useResult
  $Res call(
      {String uid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class _$HouseTornamentMemberCopyWithImpl<$Res,
        $Val extends HouseTornamentMember>
    implements $HouseTornamentMemberCopyWith<$Res> {
  _$HouseTornamentMemberCopyWithImpl(this._value, this._then);

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
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HouseTornamentMemberCopyWith<$Res>
    implements $HouseTornamentMemberCopyWith<$Res> {
  factory _$$_HouseTornamentMemberCopyWith(_$_HouseTornamentMember value,
          $Res Function(_$_HouseTornamentMember) then) =
      __$$_HouseTornamentMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class __$$_HouseTornamentMemberCopyWithImpl<$Res>
    extends _$HouseTornamentMemberCopyWithImpl<$Res, _$_HouseTornamentMember>
    implements _$$_HouseTornamentMemberCopyWith<$Res> {
  __$$_HouseTornamentMemberCopyWithImpl(_$_HouseTornamentMember _value,
      $Res Function(_$_HouseTornamentMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? joinedAt = null,
  }) {
    return _then(_$_HouseTornamentMember(
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
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HouseTornamentMember implements _HouseTornamentMember {
  const _$_HouseTornamentMember(
      {required this.uid,
      required this.userName,
      required this.userId,
      required this.userImage,
      @TimestampConverter() required this.joinedAt});

  factory _$_HouseTornamentMember.fromJson(Map<String, dynamic> json) =>
      _$$_HouseTornamentMemberFromJson(json);

  @override
  final String uid;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  @TimestampConverter()
  final Timestamp joinedAt;

  @override
  String toString() {
    return 'HouseTornamentMember(uid: $uid, userName: $userName, userId: $userId, userImage: $userImage, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseTornamentMember &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, userName, userId, userImage, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseTornamentMemberCopyWith<_$_HouseTornamentMember> get copyWith =>
      __$$_HouseTornamentMemberCopyWithImpl<_$_HouseTornamentMember>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HouseTornamentMemberToJson(
      this,
    );
  }
}

abstract class _HouseTornamentMember implements HouseTornamentMember {
  const factory _HouseTornamentMember(
          {required final String uid,
          required final String userName,
          required final String userId,
          required final String userImage,
          @TimestampConverter() required final Timestamp joinedAt}) =
      _$_HouseTornamentMember;

  factory _HouseTornamentMember.fromJson(Map<String, dynamic> json) =
      _$_HouseTornamentMember.fromJson;

  @override
  String get uid;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  @TimestampConverter()
  Timestamp get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$_HouseTornamentMemberCopyWith<_$_HouseTornamentMember> get copyWith =>
      throw _privateConstructorUsedError;
}
