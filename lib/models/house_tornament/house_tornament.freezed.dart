// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_tornament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HouseTornament _$HouseTornamentFromJson(Map<String, dynamic> json) {
  return _HouseTornament.fromJson(json);
}

/// @nodoc
mixin _$HouseTornament {
  String get houseTornamentId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get headerImage => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  @PrefNullableConverter()
  Pref? get prefecture => throw _privateConstructorUsedError;
  @CityNullableConverter()
  City? get city => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get features => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  int get numberOfParticipants => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get dartsModels => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get formats => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get dateTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get startTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get finishTime => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  bool get isFinalTornament => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get createrName => throw _privateConstructorUsedError;
  String get createrImage => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseTornamentCopyWith<HouseTornament> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseTornamentCopyWith<$Res> {
  factory $HouseTornamentCopyWith(
          HouseTornament value, $Res Function(HouseTornament) then) =
      _$HouseTornamentCopyWithImpl<$Res, HouseTornament>;
  @useResult
  $Res call(
      {String houseTornamentId,
      String title,
      String uid,
      String headerImage,
      String place,
      @PrefNullableConverter() Pref? prefecture,
      @CityNullableConverter() City? city,
      @Freezed(fromJson: true) List<String> features,
      int capacity,
      int numberOfParticipants,
      @Freezed(fromJson: true) List<String> dartsModels,
      @Freezed(fromJson: true) List<String> formats,
      @TimestampConverter() Timestamp dateTime,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp finishTime,
      String detail,
      bool isApproved,
      bool isFinalTornament,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      int followingCount,
      int followerCount,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});

  $PrefCopyWith<$Res>? get prefecture;
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$HouseTornamentCopyWithImpl<$Res, $Val extends HouseTornament>
    implements $HouseTornamentCopyWith<$Res> {
  _$HouseTornamentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseTornamentId = null,
    Object? title = null,
    Object? uid = null,
    Object? headerImage = null,
    Object? place = null,
    Object? prefecture = freezed,
    Object? city = freezed,
    Object? features = null,
    Object? capacity = null,
    Object? numberOfParticipants = null,
    Object? dartsModels = null,
    Object? formats = null,
    Object? dateTime = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? detail = null,
    Object? isApproved = null,
    Object? isFinalTornament = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      houseTornamentId: null == houseTornamentId
          ? _value.houseTornamentId
          : houseTornamentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as Pref?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      dartsModels: null == dartsModels
          ? _value.dartsModels
          : dartsModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      formats: null == formats
          ? _value.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      finishTime: null == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinalTornament: null == isFinalTornament
          ? _value.isFinalTornament
          : isFinalTornament // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createrName: null == createrName
          ? _value.createrName
          : createrName // ignore: cast_nullable_to_non_nullable
              as String,
      createrImage: null == createrImage
          ? _value.createrImage
          : createrImage // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_HouseTornamentCopyWith<$Res>
    implements $HouseTornamentCopyWith<$Res> {
  factory _$$_HouseTornamentCopyWith(
          _$_HouseTornament value, $Res Function(_$_HouseTornament) then) =
      __$$_HouseTornamentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String houseTornamentId,
      String title,
      String uid,
      String headerImage,
      String place,
      @PrefNullableConverter() Pref? prefecture,
      @CityNullableConverter() City? city,
      @Freezed(fromJson: true) List<String> features,
      int capacity,
      int numberOfParticipants,
      @Freezed(fromJson: true) List<String> dartsModels,
      @Freezed(fromJson: true) List<String> formats,
      @TimestampConverter() Timestamp dateTime,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp finishTime,
      String detail,
      bool isApproved,
      bool isFinalTornament,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      int followingCount,
      int followerCount,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});

  @override
  $PrefCopyWith<$Res>? get prefecture;
  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$_HouseTornamentCopyWithImpl<$Res>
    extends _$HouseTornamentCopyWithImpl<$Res, _$_HouseTornament>
    implements _$$_HouseTornamentCopyWith<$Res> {
  __$$_HouseTornamentCopyWithImpl(
      _$_HouseTornament _value, $Res Function(_$_HouseTornament) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houseTornamentId = null,
    Object? title = null,
    Object? uid = null,
    Object? headerImage = null,
    Object? place = null,
    Object? prefecture = freezed,
    Object? city = freezed,
    Object? features = null,
    Object? capacity = null,
    Object? numberOfParticipants = null,
    Object? dartsModels = null,
    Object? formats = null,
    Object? dateTime = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? detail = null,
    Object? isApproved = null,
    Object? isFinalTornament = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_HouseTornament(
      houseTornamentId: null == houseTornamentId
          ? _value.houseTornamentId
          : houseTornamentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      prefecture: freezed == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as Pref?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      dartsModels: null == dartsModels
          ? _value._dartsModels
          : dartsModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      formats: null == formats
          ? _value._formats
          : formats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      finishTime: null == finishTime
          ? _value.finishTime
          : finishTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinalTornament: null == isFinalTornament
          ? _value.isFinalTornament
          : isFinalTornament // ignore: cast_nullable_to_non_nullable
              as bool,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      createrName: null == createrName
          ? _value.createrName
          : createrName // ignore: cast_nullable_to_non_nullable
              as String,
      createrImage: null == createrImage
          ? _value.createrImage
          : createrImage // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HouseTornament implements _HouseTornament {
  const _$_HouseTornament(
      {required this.houseTornamentId,
      required this.title,
      required this.uid,
      this.headerImage = '',
      this.place = '',
      @PrefNullableConverter() this.prefecture,
      @CityNullableConverter() this.city,
      @Freezed(fromJson: true) final List<String> features = const [],
      this.capacity = 0,
      this.numberOfParticipants = 0,
      @Freezed(fromJson: true) final List<String> dartsModels = const [],
      @Freezed(fromJson: true) final List<String> formats = const [],
      @TimestampConverter() required this.dateTime,
      @TimestampConverter() required this.startTime,
      @TimestampConverter() required this.finishTime,
      this.detail = '',
      this.isApproved = false,
      this.isFinalTornament = false,
      required this.ownerId,
      required this.createrName,
      required this.createrImage,
      required this.userId,
      this.followingCount = 0,
      this.followerCount = 0,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _features = features,
        _dartsModels = dartsModels,
        _formats = formats;

  factory _$_HouseTornament.fromJson(Map<String, dynamic> json) =>
      _$$_HouseTornamentFromJson(json);

  @override
  final String houseTornamentId;
  @override
  final String title;
  @override
  final String uid;
  @override
  @JsonKey()
  final String headerImage;
  @override
  @JsonKey()
  final String place;
  @override
  @PrefNullableConverter()
  final Pref? prefecture;
  @override
  @CityNullableConverter()
  final City? city;
  final List<String> _features;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey()
  final int capacity;
  @override
  @JsonKey()
  final int numberOfParticipants;
  final List<String> _dartsModels;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get dartsModels {
    if (_dartsModels is EqualUnmodifiableListView) return _dartsModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dartsModels);
  }

  final List<String> _formats;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get formats {
    if (_formats is EqualUnmodifiableListView) return _formats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formats);
  }

  @override
  @TimestampConverter()
  final Timestamp dateTime;
  @override
  @TimestampConverter()
  final Timestamp startTime;
  @override
  @TimestampConverter()
  final Timestamp finishTime;
  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey()
  final bool isApproved;
  @override
  @JsonKey()
  final bool isFinalTornament;
  @override
  final String ownerId;
  @override
  final String createrName;
  @override
  final String createrImage;
  @override
  final String userId;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'HouseTornament(houseTornamentId: $houseTornamentId, title: $title, uid: $uid, headerImage: $headerImage, place: $place, prefecture: $prefecture, city: $city, features: $features, capacity: $capacity, numberOfParticipants: $numberOfParticipants, dartsModels: $dartsModels, formats: $formats, dateTime: $dateTime, startTime: $startTime, finishTime: $finishTime, detail: $detail, isApproved: $isApproved, isFinalTornament: $isFinalTornament, ownerId: $ownerId, createrName: $createrName, createrImage: $createrImage, userId: $userId, followingCount: $followingCount, followerCount: $followerCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HouseTornament &&
            (identical(other.houseTornamentId, houseTornamentId) ||
                other.houseTornamentId == houseTornamentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.headerImage, headerImage) ||
                other.headerImage == headerImage) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.numberOfParticipants, numberOfParticipants) ||
                other.numberOfParticipants == numberOfParticipants) &&
            const DeepCollectionEquality()
                .equals(other._dartsModels, _dartsModels) &&
            const DeepCollectionEquality().equals(other._formats, _formats) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isFinalTornament, isFinalTornament) ||
                other.isFinalTornament == isFinalTornament) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createrName, createrName) ||
                other.createrName == createrName) &&
            (identical(other.createrImage, createrImage) ||
                other.createrImage == createrImage) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        houseTornamentId,
        title,
        uid,
        headerImage,
        place,
        prefecture,
        city,
        const DeepCollectionEquality().hash(_features),
        capacity,
        numberOfParticipants,
        const DeepCollectionEquality().hash(_dartsModels),
        const DeepCollectionEquality().hash(_formats),
        dateTime,
        startTime,
        finishTime,
        detail,
        isApproved,
        isFinalTornament,
        ownerId,
        createrName,
        createrImage,
        userId,
        followingCount,
        followerCount,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseTornamentCopyWith<_$_HouseTornament> get copyWith =>
      __$$_HouseTornamentCopyWithImpl<_$_HouseTornament>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HouseTornamentToJson(
      this,
    );
  }
}

abstract class _HouseTornament implements HouseTornament {
  const factory _HouseTornament(
          {required final String houseTornamentId,
          required final String title,
          required final String uid,
          final String headerImage,
          final String place,
          @PrefNullableConverter() final Pref? prefecture,
          @CityNullableConverter() final City? city,
          @Freezed(fromJson: true) final List<String> features,
          final int capacity,
          final int numberOfParticipants,
          @Freezed(fromJson: true) final List<String> dartsModels,
          @Freezed(fromJson: true) final List<String> formats,
          @TimestampConverter() required final Timestamp dateTime,
          @TimestampConverter() required final Timestamp startTime,
          @TimestampConverter() required final Timestamp finishTime,
          final String detail,
          final bool isApproved,
          final bool isFinalTornament,
          required final String ownerId,
          required final String createrName,
          required final String createrImage,
          required final String userId,
          final int followingCount,
          final int followerCount,
          @TimestampConverter() required final Timestamp createdAt,
          @TimestampConverter() required final Timestamp updatedAt}) =
      _$_HouseTornament;

  factory _HouseTornament.fromJson(Map<String, dynamic> json) =
      _$_HouseTornament.fromJson;

  @override
  String get houseTornamentId;
  @override
  String get title;
  @override
  String get uid;
  @override
  String get headerImage;
  @override
  String get place;
  @override
  @PrefNullableConverter()
  Pref? get prefecture;
  @override
  @CityNullableConverter()
  City? get city;
  @override
  @Freezed(fromJson: true)
  List<String> get features;
  @override
  int get capacity;
  @override
  int get numberOfParticipants;
  @override
  @Freezed(fromJson: true)
  List<String> get dartsModels;
  @override
  @Freezed(fromJson: true)
  List<String> get formats;
  @override
  @TimestampConverter()
  Timestamp get dateTime;
  @override
  @TimestampConverter()
  Timestamp get startTime;
  @override
  @TimestampConverter()
  Timestamp get finishTime;
  @override
  String get detail;
  @override
  bool get isApproved;
  @override
  bool get isFinalTornament;
  @override
  String get ownerId;
  @override
  String get createrName;
  @override
  String get createrImage;
  @override
  String get userId;
  @override
  int get followingCount;
  @override
  int get followerCount;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_HouseTornamentCopyWith<_$_HouseTornament> get copyWith =>
      throw _privateConstructorUsedError;
}