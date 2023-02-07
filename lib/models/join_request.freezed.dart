// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JoinRequest _$JoinRequestFromJson(Map<String, dynamic> json) {
  return _JoinRequest.fromJson(json);
}

/// @nodoc
mixin _$JoinRequest {
  String get userName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get approvedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get requestedAt => throw _privateConstructorUsedError;
  JoinRequestStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinRequestCopyWith<JoinRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRequestCopyWith<$Res> {
  factory $JoinRequestCopyWith(
          JoinRequest value, $Res Function(JoinRequest) then) =
      _$JoinRequestCopyWithImpl<$Res, JoinRequest>;
  @useResult
  $Res call(
      {String userName,
      String uid,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp? approvedAt,
      @TimestampConverter() Timestamp requestedAt,
      JoinRequestStatus status});
}

/// @nodoc
class _$JoinRequestCopyWithImpl<$Res, $Val extends JoinRequest>
    implements $JoinRequestCopyWith<$Res> {
  _$JoinRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? uid = null,
    Object? userId = null,
    Object? userImage = null,
    Object? approvedAt = freezed,
    Object? requestedAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinRequestStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JoinRequestCopyWith<$Res>
    implements $JoinRequestCopyWith<$Res> {
  factory _$$_JoinRequestCopyWith(
          _$_JoinRequest value, $Res Function(_$_JoinRequest) then) =
      __$$_JoinRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String uid,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp? approvedAt,
      @TimestampConverter() Timestamp requestedAt,
      JoinRequestStatus status});
}

/// @nodoc
class __$$_JoinRequestCopyWithImpl<$Res>
    extends _$JoinRequestCopyWithImpl<$Res, _$_JoinRequest>
    implements _$$_JoinRequestCopyWith<$Res> {
  __$$_JoinRequestCopyWithImpl(
      _$_JoinRequest _value, $Res Function(_$_JoinRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? uid = null,
    Object? userId = null,
    Object? userImage = null,
    Object? approvedAt = freezed,
    Object? requestedAt = null,
    Object? status = null,
  }) {
    return _then(_$_JoinRequest(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      requestedAt: null == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinRequestStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JoinRequest implements _JoinRequest {
  const _$_JoinRequest(
      {required this.userName,
      required this.uid,
      required this.userId,
      required this.userImage,
      @TimestampConverter() this.approvedAt,
      @TimestampConverter() required this.requestedAt,
      this.status = JoinRequestStatus.requesting});

  factory _$_JoinRequest.fromJson(Map<String, dynamic> json) =>
      _$$_JoinRequestFromJson(json);

  @override
  final String userName;
  @override
  final String uid;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  @TimestampConverter()
  final Timestamp? approvedAt;
  @override
  @TimestampConverter()
  final Timestamp requestedAt;
  @override
  @JsonKey()
  final JoinRequestStatus status;

  @override
  String toString() {
    return 'JoinRequest(userName: $userName, uid: $uid, userId: $userId, userImage: $userImage, approvedAt: $approvedAt, requestedAt: $requestedAt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinRequest &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, uid, userId, userImage,
      approvedAt, requestedAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinRequestCopyWith<_$_JoinRequest> get copyWith =>
      __$$_JoinRequestCopyWithImpl<_$_JoinRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JoinRequestToJson(
      this,
    );
  }
}

abstract class _JoinRequest implements JoinRequest {
  const factory _JoinRequest(
      {required final String userName,
      required final String uid,
      required final String userId,
      required final String userImage,
      @TimestampConverter() final Timestamp? approvedAt,
      @TimestampConverter() required final Timestamp requestedAt,
      final JoinRequestStatus status}) = _$_JoinRequest;

  factory _JoinRequest.fromJson(Map<String, dynamic> json) =
      _$_JoinRequest.fromJson;

  @override
  String get userName;
  @override
  String get uid;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  @TimestampConverter()
  Timestamp? get approvedAt;
  @override
  @TimestampConverter()
  Timestamp get requestedAt;
  @override
  JoinRequestStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_JoinRequestCopyWith<_$_JoinRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
