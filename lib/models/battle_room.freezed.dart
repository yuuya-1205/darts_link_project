// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BattleRoom _$BattleRoomFromJson(Map<String, dynamic> json) {
  return _BattleRoom.fromJson(json);
}

/// @nodoc
mixin _$BattleRoom {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  @PrefNullableConverter()
  Pref? get prefecture => throw _privateConstructorUsedError;
  @CityNullableConverter()
  City? get city => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get dateTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get startTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get finishTime => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get fetures => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get dartsModels => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  int get numberOfParticipants => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get createrName => throw _privateConstructorUsedError;
  String get createrImage => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleRoomCopyWith<BattleRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleRoomCopyWith<$Res> {
  factory $BattleRoomCopyWith(
          BattleRoom value, $Res Function(BattleRoom) then) =
      _$BattleRoomCopyWithImpl<$Res, BattleRoom>;
  @useResult
  $Res call(
      {String id,
      String title,
      String place,
      @PrefNullableConverter() Pref? prefecture,
      @CityNullableConverter() City? city,
      @TimestampConverter() Timestamp dateTime,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp finishTime,
      @Freezed(fromJson: true) List<String> fetures,
      @Freezed(fromJson: true) List<String> dartsModels,
      String detail,
      int numberOfParticipants,
      bool isApproved,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      int followingCount,
      int followerCount,
      int capacity});

  $PrefCopyWith<$Res>? get prefecture;
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$BattleRoomCopyWithImpl<$Res, $Val extends BattleRoom>
    implements $BattleRoomCopyWith<$Res> {
  _$BattleRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? place = null,
    Object? prefecture = freezed,
    Object? city = freezed,
    Object? dateTime = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? fetures = null,
    Object? dartsModels = null,
    Object? detail = null,
    Object? numberOfParticipants = null,
    Object? isApproved = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? capacity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      fetures: null == fetures
          ? _value.fetures
          : fetures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dartsModels: null == dartsModels
          ? _value.dartsModels
          : dartsModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_BattleRoomCopyWith<$Res>
    implements $BattleRoomCopyWith<$Res> {
  factory _$$_BattleRoomCopyWith(
          _$_BattleRoom value, $Res Function(_$_BattleRoom) then) =
      __$$_BattleRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String place,
      @PrefNullableConverter() Pref? prefecture,
      @CityNullableConverter() City? city,
      @TimestampConverter() Timestamp dateTime,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp finishTime,
      @Freezed(fromJson: true) List<String> fetures,
      @Freezed(fromJson: true) List<String> dartsModels,
      String detail,
      int numberOfParticipants,
      bool isApproved,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      int followingCount,
      int followerCount,
      int capacity});

  @override
  $PrefCopyWith<$Res>? get prefecture;
  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$_BattleRoomCopyWithImpl<$Res>
    extends _$BattleRoomCopyWithImpl<$Res, _$_BattleRoom>
    implements _$$_BattleRoomCopyWith<$Res> {
  __$$_BattleRoomCopyWithImpl(
      _$_BattleRoom _value, $Res Function(_$_BattleRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? place = null,
    Object? prefecture = freezed,
    Object? city = freezed,
    Object? dateTime = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? fetures = null,
    Object? dartsModels = null,
    Object? detail = null,
    Object? numberOfParticipants = null,
    Object? isApproved = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? capacity = null,
  }) {
    return _then(_$_BattleRoom(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      fetures: null == fetures
          ? _value._fetures
          : fetures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dartsModels: null == dartsModels
          ? _value._dartsModels
          : dartsModels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfParticipants: null == numberOfParticipants
          ? _value.numberOfParticipants
          : numberOfParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BattleRoom implements _BattleRoom {
  const _$_BattleRoom(
      {required this.id,
      required this.title,
      this.place = '',
      @PrefNullableConverter() this.prefecture,
      @CityNullableConverter() this.city,
      @TimestampConverter() required this.dateTime,
      @TimestampConverter() required this.startTime,
      @TimestampConverter() required this.finishTime,
      @Freezed(fromJson: true) final List<String> fetures = const [],
      @Freezed(fromJson: true) final List<String> dartsModels = const [],
      this.detail = '',
      this.numberOfParticipants = 0,
      this.isApproved = false,
      required this.ownerId,
      required this.createrName,
      required this.createrImage,
      required this.userId,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      this.followingCount = 0,
      this.followerCount = 0,
      this.capacity = 0})
      : _fetures = fetures,
        _dartsModels = dartsModels;

  factory _$_BattleRoom.fromJson(Map<String, dynamic> json) =>
      _$$_BattleRoomFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String place;
  @override
  @PrefNullableConverter()
  final Pref? prefecture;
  @override
  @CityNullableConverter()
  final City? city;
  @override
  @TimestampConverter()
  final Timestamp dateTime;
  @override
  @TimestampConverter()
  final Timestamp startTime;
  @override
  @TimestampConverter()
  final Timestamp finishTime;
  final List<String> _fetures;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get fetures {
    if (_fetures is EqualUnmodifiableListView) return _fetures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fetures);
  }

  final List<String> _dartsModels;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get dartsModels {
    if (_dartsModels is EqualUnmodifiableListView) return _dartsModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dartsModels);
  }

  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey()
  final int numberOfParticipants;
  @override
  @JsonKey()
  final bool isApproved;
  @override
  final String ownerId;
  @override
  final String createrName;
  @override
  final String createrImage;
  @override
  final String userId;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final int capacity;

  @override
  String toString() {
    return 'BattleRoom(id: $id, title: $title, place: $place, prefecture: $prefecture, city: $city, dateTime: $dateTime, startTime: $startTime, finishTime: $finishTime, fetures: $fetures, dartsModels: $dartsModels, detail: $detail, numberOfParticipants: $numberOfParticipants, isApproved: $isApproved, ownerId: $ownerId, createrName: $createrName, createrImage: $createrImage, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, followingCount: $followingCount, followerCount: $followerCount, capacity: $capacity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BattleRoom &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            const DeepCollectionEquality().equals(other._fetures, _fetures) &&
            const DeepCollectionEquality()
                .equals(other._dartsModels, _dartsModels) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.numberOfParticipants, numberOfParticipants) ||
                other.numberOfParticipants == numberOfParticipants) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createrName, createrName) ||
                other.createrName == createrName) &&
            (identical(other.createrImage, createrImage) ||
                other.createrImage == createrImage) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        place,
        prefecture,
        city,
        dateTime,
        startTime,
        finishTime,
        const DeepCollectionEquality().hash(_fetures),
        const DeepCollectionEquality().hash(_dartsModels),
        detail,
        numberOfParticipants,
        isApproved,
        ownerId,
        createrName,
        createrImage,
        userId,
        createdAt,
        updatedAt,
        followingCount,
        followerCount,
        capacity
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BattleRoomCopyWith<_$_BattleRoom> get copyWith =>
      __$$_BattleRoomCopyWithImpl<_$_BattleRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BattleRoomToJson(
      this,
    );
  }
}

abstract class _BattleRoom implements BattleRoom {
  const factory _BattleRoom(
      {required final String id,
      required final String title,
      final String place,
      @PrefNullableConverter() final Pref? prefecture,
      @CityNullableConverter() final City? city,
      @TimestampConverter() required final Timestamp dateTime,
      @TimestampConverter() required final Timestamp startTime,
      @TimestampConverter() required final Timestamp finishTime,
      @Freezed(fromJson: true) final List<String> fetures,
      @Freezed(fromJson: true) final List<String> dartsModels,
      final String detail,
      final int numberOfParticipants,
      final bool isApproved,
      required final String ownerId,
      required final String createrName,
      required final String createrImage,
      required final String userId,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt,
      final int followingCount,
      final int followerCount,
      final int capacity}) = _$_BattleRoom;

  factory _BattleRoom.fromJson(Map<String, dynamic> json) =
      _$_BattleRoom.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get place;
  @override
  @PrefNullableConverter()
  Pref? get prefecture;
  @override
  @CityNullableConverter()
  City? get city;
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
  @Freezed(fromJson: true)
  List<String> get fetures;
  @override
  @Freezed(fromJson: true)
  List<String> get dartsModels;
  @override
  String get detail;
  @override
  int get numberOfParticipants;
  @override
  bool get isApproved;
  @override
  String get ownerId;
  @override
  String get createrName;
  @override
  String get createrImage;
  @override
  String get userId;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  int get followingCount;
  @override
  int get followerCount;
  @override
  int get capacity;
  @override
  @JsonKey(ignore: true)
  _$$_BattleRoomCopyWith<_$_BattleRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
