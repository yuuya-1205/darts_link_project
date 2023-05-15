// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_store_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteStoreOwner _$FavoriteStoreOwnerFromJson(Map<String, dynamic> json) {
  return _FavoriteStoreOwner.fromJson(json);
}

/// @nodoc
mixin _$FavoriteStoreOwner {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteStoreOwnerCopyWith<FavoriteStoreOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStoreOwnerCopyWith<$Res> {
  factory $FavoriteStoreOwnerCopyWith(
          FavoriteStoreOwner value, $Res Function(FavoriteStoreOwner) then) =
      _$FavoriteStoreOwnerCopyWithImpl<$Res, FavoriteStoreOwner>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$FavoriteStoreOwnerCopyWithImpl<$Res, $Val extends FavoriteStoreOwner>
    implements $FavoriteStoreOwnerCopyWith<$Res> {
  _$FavoriteStoreOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_FavoriteStoreOwnerCopyWith<$Res>
    implements $FavoriteStoreOwnerCopyWith<$Res> {
  factory _$$_FavoriteStoreOwnerCopyWith(_$_FavoriteStoreOwner value,
          $Res Function(_$_FavoriteStoreOwner) then) =
      __$$_FavoriteStoreOwnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String userImage,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_FavoriteStoreOwnerCopyWithImpl<$Res>
    extends _$FavoriteStoreOwnerCopyWithImpl<$Res, _$_FavoriteStoreOwner>
    implements _$$_FavoriteStoreOwnerCopyWith<$Res> {
  __$$_FavoriteStoreOwnerCopyWithImpl(
      _$_FavoriteStoreOwner _value, $Res Function(_$_FavoriteStoreOwner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? userImage = null,
    Object? createdAt = null,
  }) {
    return _then(_$_FavoriteStoreOwner(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_FavoriteStoreOwner implements _FavoriteStoreOwner {
  const _$_FavoriteStoreOwner(
      {this.id = '',
      required this.userName,
      required this.userId,
      required this.userImage,
      @TimestampConverter() required this.createdAt});

  factory _$_FavoriteStoreOwner.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteStoreOwnerFromJson(json);

  @override
  @JsonKey()
  final String id;
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
    return 'FavoriteStoreOwner(id: $id, userName: $userName, userId: $userId, userImage: $userImage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteStoreOwner &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode =>
      Object.hash(runtimeType, id, userName, userId, userImage, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteStoreOwnerCopyWith<_$_FavoriteStoreOwner> get copyWith =>
      __$$_FavoriteStoreOwnerCopyWithImpl<_$_FavoriteStoreOwner>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteStoreOwnerToJson(
      this,
    );
  }
}

abstract class _FavoriteStoreOwner implements FavoriteStoreOwner {
  const factory _FavoriteStoreOwner(
          {final String id,
          required final String userName,
          required final String userId,
          required final String userImage,
          @TimestampConverter() required final Timestamp createdAt}) =
      _$_FavoriteStoreOwner;

  factory _FavoriteStoreOwner.fromJson(Map<String, dynamic> json) =
      _$_FavoriteStoreOwner.fromJson;

  @override
  String get id;
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
  _$$_FavoriteStoreOwnerCopyWith<_$_FavoriteStoreOwner> get copyWith =>
      throw _privateConstructorUsedError;
}
