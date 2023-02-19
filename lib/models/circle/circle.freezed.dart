// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Circle _$CircleFromJson(Map<String, dynamic> json) {
  return _Circle.fromJson(json);
}

/// @nodoc
mixin _$Circle {
  String get circleId => throw _privateConstructorUsedError;
  String get circleName => throw _privateConstructorUsedError;
  String get circleDetail => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  String get headerImage => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get imageUrls => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get memberUids => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get features => throw _privateConstructorUsedError;
  String get prefecture => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  int get numberOfParticipants => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get createrName => throw _privateConstructorUsedError;
  String get createrImage => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CircleCopyWith<Circle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircleCopyWith<$Res> {
  factory $CircleCopyWith(Circle value, $Res Function(Circle) then) =
      _$CircleCopyWithImpl<$Res, Circle>;
  @useResult
  $Res call(
      {String circleId,
      String circleName,
      String circleDetail,
      String place,
      String headerImage,
      @Freezed(fromJson: true) List<String> imageUrls,
      @Freezed(fromJson: true) List<String> memberUids,
      @Freezed(fromJson: true) List<String> features,
      String prefecture,
      String city,
      int capacity,
      int numberOfParticipants,
      bool isApproved,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      int followingCount,
      int followerCount,
      @TimestampConverter() Timestamp updatedAt,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$CircleCopyWithImpl<$Res, $Val extends Circle>
    implements $CircleCopyWith<$Res> {
  _$CircleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? circleId = null,
    Object? circleName = null,
    Object? circleDetail = null,
    Object? place = null,
    Object? headerImage = null,
    Object? imageUrls = null,
    Object? memberUids = null,
    Object? features = null,
    Object? prefecture = null,
    Object? city = null,
    Object? capacity = null,
    Object? numberOfParticipants = null,
    Object? isApproved = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      circleId: null == circleId
          ? _value.circleId
          : circleId // ignore: cast_nullable_to_non_nullable
              as String,
      circleName: null == circleName
          ? _value.circleName
          : circleName // ignore: cast_nullable_to_non_nullable
              as String,
      circleDetail: null == circleDetail
          ? _value.circleDetail
          : circleDetail // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberUids: null == memberUids
          ? _value.memberUids
          : memberUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prefecture: null == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
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
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CircleCopyWith<$Res> implements $CircleCopyWith<$Res> {
  factory _$$_CircleCopyWith(_$_Circle value, $Res Function(_$_Circle) then) =
      __$$_CircleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String circleId,
      String circleName,
      String circleDetail,
      String place,
      String headerImage,
      @Freezed(fromJson: true) List<String> imageUrls,
      @Freezed(fromJson: true) List<String> memberUids,
      @Freezed(fromJson: true) List<String> features,
      String prefecture,
      String city,
      int capacity,
      int numberOfParticipants,
      bool isApproved,
      String ownerId,
      String createrName,
      String createrImage,
      String userId,
      int followingCount,
      int followerCount,
      @TimestampConverter() Timestamp updatedAt,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_CircleCopyWithImpl<$Res>
    extends _$CircleCopyWithImpl<$Res, _$_Circle>
    implements _$$_CircleCopyWith<$Res> {
  __$$_CircleCopyWithImpl(_$_Circle _value, $Res Function(_$_Circle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? circleId = null,
    Object? circleName = null,
    Object? circleDetail = null,
    Object? place = null,
    Object? headerImage = null,
    Object? imageUrls = null,
    Object? memberUids = null,
    Object? features = null,
    Object? prefecture = null,
    Object? city = null,
    Object? capacity = null,
    Object? numberOfParticipants = null,
    Object? isApproved = null,
    Object? ownerId = null,
    Object? createrName = null,
    Object? createrImage = null,
    Object? userId = null,
    Object? followingCount = null,
    Object? followerCount = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Circle(
      circleId: null == circleId
          ? _value.circleId
          : circleId // ignore: cast_nullable_to_non_nullable
              as String,
      circleName: null == circleName
          ? _value.circleName
          : circleName // ignore: cast_nullable_to_non_nullable
              as String,
      circleDetail: null == circleDetail
          ? _value.circleDetail
          : circleDetail // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberUids: null == memberUids
          ? _value._memberUids
          : memberUids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prefecture: null == prefecture
          ? _value.prefecture
          : prefecture // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
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
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Circle implements _Circle {
  const _$_Circle(
      {required this.circleId,
      required this.circleName,
      required this.circleDetail,
      this.place = '',
      this.headerImage = '',
      @Freezed(fromJson: true) final List<String> imageUrls = const [],
      @Freezed(fromJson: true) final List<String> memberUids = const [],
      @Freezed(fromJson: true) final List<String> features = const [],
      this.prefecture = '未登録',
      this.city = '未登録',
      this.capacity = 0,
      this.numberOfParticipants = 0,
      this.isApproved = false,
      required this.ownerId,
      required this.createrName,
      required this.createrImage,
      required this.userId,
      this.followingCount = 0,
      this.followerCount = 0,
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() required this.createdAt})
      : _imageUrls = imageUrls,
        _memberUids = memberUids,
        _features = features;

  factory _$_Circle.fromJson(Map<String, dynamic> json) =>
      _$$_CircleFromJson(json);

  @override
  final String circleId;
  @override
  final String circleName;
  @override
  final String circleDetail;
  @override
  @JsonKey()
  final String place;
  @override
  @JsonKey()
  final String headerImage;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _memberUids;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get memberUids {
    if (_memberUids is EqualUnmodifiableListView) return _memberUids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberUids);
  }

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
  final String prefecture;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final int capacity;
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
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Circle(circleId: $circleId, circleName: $circleName, circleDetail: $circleDetail, place: $place, headerImage: $headerImage, imageUrls: $imageUrls, memberUids: $memberUids, features: $features, prefecture: $prefecture, city: $city, capacity: $capacity, numberOfParticipants: $numberOfParticipants, isApproved: $isApproved, ownerId: $ownerId, createrName: $createrName, createrImage: $createrImage, userId: $userId, followingCount: $followingCount, followerCount: $followerCount, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Circle &&
            (identical(other.circleId, circleId) ||
                other.circleId == circleId) &&
            (identical(other.circleName, circleName) ||
                other.circleName == circleName) &&
            (identical(other.circleDetail, circleDetail) ||
                other.circleDetail == circleDetail) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.headerImage, headerImage) ||
                other.headerImage == headerImage) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._memberUids, _memberUids) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.prefecture, prefecture) ||
                other.prefecture == prefecture) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
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
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        circleId,
        circleName,
        circleDetail,
        place,
        headerImage,
        const DeepCollectionEquality().hash(_imageUrls),
        const DeepCollectionEquality().hash(_memberUids),
        const DeepCollectionEquality().hash(_features),
        prefecture,
        city,
        capacity,
        numberOfParticipants,
        isApproved,
        ownerId,
        createrName,
        createrImage,
        userId,
        followingCount,
        followerCount,
        updatedAt,
        createdAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CircleCopyWith<_$_Circle> get copyWith =>
      __$$_CircleCopyWithImpl<_$_Circle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CircleToJson(
      this,
    );
  }
}

abstract class _Circle implements Circle {
  const factory _Circle(
      {required final String circleId,
      required final String circleName,
      required final String circleDetail,
      final String place,
      final String headerImage,
      @Freezed(fromJson: true) final List<String> imageUrls,
      @Freezed(fromJson: true) final List<String> memberUids,
      @Freezed(fromJson: true) final List<String> features,
      final String prefecture,
      final String city,
      final int capacity,
      final int numberOfParticipants,
      final bool isApproved,
      required final String ownerId,
      required final String createrName,
      required final String createrImage,
      required final String userId,
      final int followingCount,
      final int followerCount,
      @TimestampConverter() required final Timestamp updatedAt,
      @TimestampConverter() required final Timestamp createdAt}) = _$_Circle;

  factory _Circle.fromJson(Map<String, dynamic> json) = _$_Circle.fromJson;

  @override
  String get circleId;
  @override
  String get circleName;
  @override
  String get circleDetail;
  @override
  String get place;
  @override
  String get headerImage;
  @override
  @Freezed(fromJson: true)
  List<String> get imageUrls;
  @override
  @Freezed(fromJson: true)
  List<String> get memberUids;
  @override
  @Freezed(fromJson: true)
  List<String> get features;
  @override
  String get prefecture;
  @override
  String get city;
  @override
  int get capacity;
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
  int get followingCount;
  @override
  int get followerCount;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_CircleCopyWith<_$_Circle> get copyWith =>
      throw _privateConstructorUsedError;
}
