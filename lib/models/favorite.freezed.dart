// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  String get userName => throw _privateConstructorUsedError;
  String get favoriteId => throw _privateConstructorUsedError;
  String get dartsBarId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {String userName,
      String favoriteId,
      String dartsBarId,
      String userId,
      String userImage,
      String text,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? favoriteId = null,
    Object? dartsBarId = null,
    Object? userId = null,
    Object? userImage = null,
    Object? text = null,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
      dartsBarId: null == dartsBarId
          ? _value.dartsBarId
          : dartsBarId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$$_FavoriteCopyWith(
          _$_Favorite value, $Res Function(_$_Favorite) then) =
      __$$_FavoriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String favoriteId,
      String dartsBarId,
      String userId,
      String userImage,
      String text,
      @TimestampConverter() Timestamp joinedAt});
}

/// @nodoc
class __$$_FavoriteCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$_Favorite>
    implements _$$_FavoriteCopyWith<$Res> {
  __$$_FavoriteCopyWithImpl(
      _$_Favorite _value, $Res Function(_$_Favorite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? favoriteId = null,
    Object? dartsBarId = null,
    Object? userId = null,
    Object? userImage = null,
    Object? text = null,
    Object? joinedAt = null,
  }) {
    return _then(_$_Favorite(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
      dartsBarId: null == dartsBarId
          ? _value.dartsBarId
          : dartsBarId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
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
class _$_Favorite implements _Favorite {
  const _$_Favorite(
      {required this.userName,
      required this.favoriteId,
      required this.dartsBarId,
      required this.userId,
      required this.userImage,
      this.text = '',
      @TimestampConverter() required this.joinedAt});

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  @override
  final String userName;
  @override
  final String favoriteId;
  @override
  final String dartsBarId;
  @override
  final String userId;
  @override
  final String userImage;
  @override
  @JsonKey()
  final String text;
  @override
  @TimestampConverter()
  final Timestamp joinedAt;

  @override
  String toString() {
    return 'Favorite(userName: $userName, favoriteId: $favoriteId, dartsBarId: $dartsBarId, userId: $userId, userImage: $userImage, text: $text, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorite &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.favoriteId, favoriteId) ||
                other.favoriteId == favoriteId) &&
            (identical(other.dartsBarId, dartsBarId) ||
                other.dartsBarId == dartsBarId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, favoriteId, dartsBarId,
      userId, userImage, text, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      __$$_FavoriteCopyWithImpl<_$_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {required final String userName,
      required final String favoriteId,
      required final String dartsBarId,
      required final String userId,
      required final String userImage,
      final String text,
      @TimestampConverter() required final Timestamp joinedAt}) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  String get userName;
  @override
  String get favoriteId;
  @override
  String get dartsBarId;
  @override
  String get userId;
  @override
  String get userImage;
  @override
  String get text;
  @override
  @TimestampConverter()
  Timestamp get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
