// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'person':
      return Person.fromJson(json);
    case 'storeOwner':
      return StoreOwner.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppUser',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get headerImage => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @PrefNullableConverter()
  Pref? get prefecture => throw _privateConstructorUsedError;
  @CityNullableConverter()
  City? get city => throw _privateConstructorUsedError;
  String get selfIntroduction => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get tag => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)
        person,
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)
        storeOwner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(StoreOwner value) storeOwner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(StoreOwner value)? storeOwner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(StoreOwner value)? storeOwner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String headerImage,
      String userImage,
      @PrefNullableConverter() Pref prefecture,
      @CityNullableConverter() City city,
      String selfIntroduction,
      int followerCount,
      int followingCount,
      @Freezed(fromJson: true) List<String> tag,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});

  $PrefCopyWith<$Res>? get prefecture;
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

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
    Object? headerImage = null,
    Object? userImage = null,
    Object? prefecture = null,
    Object? city = null,
    Object? selfIntroduction = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? tag = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: null == prefecture
          ? _value.prefecture!
          : prefecture // ignore: cast_nullable_to_non_nullable
              as Pref,
      city: null == city
          ? _value.city!
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

  @override
  @pragma('vm:prefer-inline')
  $PrefCopyWith<$Res>? get prefecture {
    if (_value.prefecture == null) {
      return null;
    }

    return $PrefCopyWith<$Res>(_value.prefecture!, (value) {
      return _then(_value.copyWith(prefecture: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$PersonCopyWith(_$Person value, $Res Function(_$Person) then) =
      __$$PersonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String headerImage,
      String userImage,
      @PrefNullableConverter() Pref? prefecture,
      @CityNullableConverter() City? city,
      String selfIntroduction,
      int followerCount,
      int followingCount,
      @Freezed(fromJson: true) List<String> tag,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      String gender,
      int dartsLiveRating,
      int phoenixRating});

  @override
  $PrefCopyWith<$Res>? get prefecture;
  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$PersonCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res, _$Person>
    implements _$$PersonCopyWith<$Res> {
  __$$PersonCopyWithImpl(_$Person _value, $Res Function(_$Person) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? headerImage = null,
    Object? userImage = null,
    Object? prefecture = freezed,
    Object? city = freezed,
    Object? selfIntroduction = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? tag = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? gender = null,
    Object? dartsLiveRating = null,
    Object? phoenixRating = null,
  }) {
    return _then(_$Person(
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
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as Pref?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dartsLiveRating: null == dartsLiveRating
          ? _value.dartsLiveRating
          : dartsLiveRating // ignore: cast_nullable_to_non_nullable
              as int,
      phoenixRating: null == phoenixRating
          ? _value.phoenixRating
          : phoenixRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Person implements Person {
  const _$Person(
      {required this.id,
      required this.userName,
      required this.userId,
      this.headerImage = '',
      this.userImage = '',
      @PrefNullableConverter() this.prefecture,
      @CityNullableConverter() this.city,
      this.selfIntroduction = '',
      this.followerCount = 0,
      this.followingCount = 0,
      @Freezed(fromJson: true) final List<String> tag = const [],
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      this.gender = '未設定',
      this.dartsLiveRating = 1,
      this.phoenixRating = 1,
      final String? $type})
      : _tag = tag,
        $type = $type ?? 'person';

  factory _$Person.fromJson(Map<String, dynamic> json) =>
      _$$PersonFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String userId;
  @override
  @JsonKey()
  final String headerImage;
  @override
  @JsonKey()
  final String userImage;
  @override
  @PrefNullableConverter()
  final Pref? prefecture;
  @override
  @CityNullableConverter()
  final City? city;
  @override
  @JsonKey()
  final String selfIntroduction;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final int followingCount;
  final List<String> _tag;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
// ここから共通化してないものを入力をする
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final int dartsLiveRating;
  @override
  @JsonKey()
  final int phoenixRating;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.person(id: $id, userName: $userName, userId: $userId, headerImage: $headerImage, userImage: $userImage, prefecture: $prefecture, city: $city, selfIntroduction: $selfIntroduction, followerCount: $followerCount, followingCount: $followingCount, tag: $tag, createdAt: $createdAt, updatedAt: $updatedAt, gender: $gender, dartsLiveRating: $dartsLiveRating, phoenixRating: $phoenixRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Person &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.headerImage, headerImage) ||
                other.headerImage == headerImage) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dartsLiveRating, dartsLiveRating) ||
                other.dartsLiveRating == dartsLiveRating) &&
            (identical(other.phoenixRating, phoenixRating) ||
                other.phoenixRating == phoenixRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      userId,
      headerImage,
      userImage,
      prefecture,
      city,
      selfIntroduction,
      followerCount,
      followingCount,
      const DeepCollectionEquality().hash(_tag),
      createdAt,
      updatedAt,
      gender,
      dartsLiveRating,
      phoenixRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonCopyWith<_$Person> get copyWith =>
      __$$PersonCopyWithImpl<_$Person>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)
        person,
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)
        storeOwner,
  }) {
    return person(
        id,
        userName,
        userId,
        headerImage,
        userImage,
        prefecture,
        city,
        selfIntroduction,
        followerCount,
        followingCount,
        tag,
        createdAt,
        updatedAt,
        gender,
        dartsLiveRating,
        phoenixRating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
  }) {
    return person?.call(
        id,
        userName,
        userId,
        headerImage,
        userImage,
        prefecture,
        city,
        selfIntroduction,
        followerCount,
        followingCount,
        tag,
        createdAt,
        updatedAt,
        gender,
        dartsLiveRating,
        phoenixRating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
    required TResult orElse(),
  }) {
    if (person != null) {
      return person(
          id,
          userName,
          userId,
          headerImage,
          userImage,
          prefecture,
          city,
          selfIntroduction,
          followerCount,
          followingCount,
          tag,
          createdAt,
          updatedAt,
          gender,
          dartsLiveRating,
          phoenixRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(StoreOwner value) storeOwner,
  }) {
    return person(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(StoreOwner value)? storeOwner,
  }) {
    return person?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(StoreOwner value)? storeOwner,
    required TResult orElse(),
  }) {
    if (person != null) {
      return person(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonToJson(
      this,
    );
  }
}

abstract class Person implements AppUser {
  const factory Person(
      {required final String id,
      required final String userName,
      required final String userId,
      final String headerImage,
      final String userImage,
      @PrefNullableConverter() final Pref? prefecture,
      @CityNullableConverter() final City? city,
      final String selfIntroduction,
      final int followerCount,
      final int followingCount,
      @Freezed(fromJson: true) final List<String> tag,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt,
      final String gender,
      final int dartsLiveRating,
      final int phoenixRating}) = _$Person;

  factory Person.fromJson(Map<String, dynamic> json) = _$Person.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get headerImage;
  @override
  String get userImage;
  @override
  @PrefNullableConverter()
  Pref? get prefecture;
  @override
  @CityNullableConverter()
  City? get city;
  @override
  String get selfIntroduction;
  @override
  int get followerCount;
  @override
  int get followingCount;
  @override
  @Freezed(fromJson: true)
  List<String> get tag;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt; // ここから共通化してないものを入力をする
  String get gender;
  int get dartsLiveRating;
  int get phoenixRating;
  @override
  @JsonKey(ignore: true)
  _$$PersonCopyWith<_$Person> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoreOwnerCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$StoreOwnerCopyWith(
          _$StoreOwner value, $Res Function(_$StoreOwner) then) =
      __$$StoreOwnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String userId,
      String headerImage,
      String userImage,
      @PrefNonNullableConverter() Pref prefecture,
      @CityNonNullableConverter() City city,
      String selfIntroduction,
      int followerCount,
      int followingCount,
      @Freezed(fromJson: true) List<String> tag,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      String address,
      int telephoneNumber,
      bool isApproved});

  @override
  $PrefCopyWith<$Res> get prefecture;
  @override
  $CityCopyWith<$Res> get city;
}

/// @nodoc
class __$$StoreOwnerCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$StoreOwner>
    implements _$$StoreOwnerCopyWith<$Res> {
  __$$StoreOwnerCopyWithImpl(
      _$StoreOwner _value, $Res Function(_$StoreOwner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? userId = null,
    Object? headerImage = null,
    Object? userImage = null,
    Object? prefecture = null,
    Object? city = null,
    Object? selfIntroduction = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? tag = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? address = null,
    Object? telephoneNumber = null,
    Object? isApproved = null,
  }) {
    return _then(_$StoreOwner(
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
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: null == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as Pref,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      selfIntroduction: null == selfIntroduction
          ? _value.selfIntroduction
          : selfIntroduction // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      telephoneNumber: null == telephoneNumber
          ? _value.telephoneNumber
          : telephoneNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PrefCopyWith<$Res> get prefecture {
    return $PrefCopyWith<$Res>(_value.prefecture, (value) {
      return _then(_value.copyWith(prefecture: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreOwner implements StoreOwner {
  const _$StoreOwner(
      {required this.id,
      required this.userName,
      required this.userId,
      this.headerImage = '',
      this.userImage = '',
      @PrefNonNullableConverter() required this.prefecture,
      @CityNonNullableConverter() required this.city,
      required this.selfIntroduction,
      this.followerCount = 0,
      this.followingCount = 0,
      @Freezed(fromJson: true) final List<String> tag = const [],
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      required this.address,
      required this.telephoneNumber,
      this.isApproved = false,
      final String? $type})
      : _tag = tag,
        $type = $type ?? 'storeOwner';

  factory _$StoreOwner.fromJson(Map<String, dynamic> json) =>
      _$$StoreOwnerFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String userId;
  @override
  @JsonKey()
  final String headerImage;
  @override
  @JsonKey()
  final String userImage;
  @override
  @PrefNonNullableConverter()
  final Pref prefecture;
  @override
  @CityNonNullableConverter()
  final City city;
  @override
  final String selfIntroduction;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final int followingCount;
  final List<String> _tag;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
// ここから共通化してないものを書く
  @override
  final String address;
  @override
  final int telephoneNumber;
  @override
  @JsonKey()
  final bool isApproved;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.storeOwner(id: $id, userName: $userName, userId: $userId, headerImage: $headerImage, userImage: $userImage, prefecture: $prefecture, city: $city, selfIntroduction: $selfIntroduction, followerCount: $followerCount, followingCount: $followingCount, tag: $tag, createdAt: $createdAt, updatedAt: $updatedAt, address: $address, telephoneNumber: $telephoneNumber, isApproved: $isApproved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreOwner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.headerImage, headerImage) ||
                other.headerImage == headerImage) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.selfIntroduction, selfIntroduction) ||
                other.selfIntroduction == selfIntroduction) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.telephoneNumber, telephoneNumber) ||
                other.telephoneNumber == telephoneNumber) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      userId,
      headerImage,
      userImage,
      prefecture,
      city,
      selfIntroduction,
      followerCount,
      followingCount,
      const DeepCollectionEquality().hash(_tag),
      createdAt,
      updatedAt,
      address,
      telephoneNumber,
      isApproved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreOwnerCopyWith<_$StoreOwner> get copyWith =>
      __$$StoreOwnerCopyWithImpl<_$StoreOwner>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)
        person,
    required TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)
        storeOwner,
  }) {
    return storeOwner(
        id,
        userName,
        userId,
        headerImage,
        userImage,
        prefecture,
        city,
        selfIntroduction,
        followerCount,
        followingCount,
        tag,
        createdAt,
        updatedAt,
        address,
        telephoneNumber,
        isApproved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult? Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
  }) {
    return storeOwner?.call(
        id,
        userName,
        userId,
        headerImage,
        userImage,
        prefecture,
        city,
        selfIntroduction,
        followerCount,
        followingCount,
        tag,
        createdAt,
        updatedAt,
        address,
        telephoneNumber,
        isApproved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNullableConverter() Pref? prefecture,
            @CityNullableConverter() City? city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String gender,
            int dartsLiveRating,
            int phoenixRating)?
        person,
    TResult Function(
            String id,
            String userName,
            String userId,
            String headerImage,
            String userImage,
            @PrefNonNullableConverter() Pref prefecture,
            @CityNonNullableConverter() City city,
            String selfIntroduction,
            int followerCount,
            int followingCount,
            @Freezed(fromJson: true) List<String> tag,
            @TimestampConverter() Timestamp createdAt,
            @TimestampConverter() Timestamp updatedAt,
            String address,
            int telephoneNumber,
            bool isApproved)?
        storeOwner,
    required TResult orElse(),
  }) {
    if (storeOwner != null) {
      return storeOwner(
          id,
          userName,
          userId,
          headerImage,
          userImage,
          prefecture,
          city,
          selfIntroduction,
          followerCount,
          followingCount,
          tag,
          createdAt,
          updatedAt,
          address,
          telephoneNumber,
          isApproved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(StoreOwner value) storeOwner,
  }) {
    return storeOwner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(StoreOwner value)? storeOwner,
  }) {
    return storeOwner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(StoreOwner value)? storeOwner,
    required TResult orElse(),
  }) {
    if (storeOwner != null) {
      return storeOwner(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreOwnerToJson(
      this,
    );
  }
}

abstract class StoreOwner implements AppUser {
  const factory StoreOwner(
      {required final String id,
      required final String userName,
      required final String userId,
      final String headerImage,
      final String userImage,
      @PrefNonNullableConverter() required final Pref prefecture,
      @CityNonNullableConverter() required final City city,
      required final String selfIntroduction,
      final int followerCount,
      final int followingCount,
      @Freezed(fromJson: true) final List<String> tag,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt,
      required final String address,
      required final int telephoneNumber,
      final bool isApproved}) = _$StoreOwner;

  factory StoreOwner.fromJson(Map<String, dynamic> json) =
      _$StoreOwner.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get headerImage;
  @override
  String get userImage;
  @override
  @PrefNonNullableConverter()
  Pref get prefecture;
  @override
  @CityNonNullableConverter()
  City get city;
  @override
  String get selfIntroduction;
  @override
  int get followerCount;
  @override
  int get followingCount;
  @override
  @Freezed(fromJson: true)
  List<String> get tag;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt; // ここから共通化してないものを書く
  String get address;
  int get telephoneNumber;
  bool get isApproved;
  @override
  @JsonKey(ignore: true)
  _$$StoreOwnerCopyWith<_$StoreOwner> get copyWith =>
      throw _privateConstructorUsedError;
}
