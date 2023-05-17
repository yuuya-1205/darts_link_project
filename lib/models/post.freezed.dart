// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get posterRef =>
      throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get postImage => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get liked => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String userName,
      String userId,
      String text,
      @DocumentReferenceConverter() DocumentReference<Object?> posterRef,
      String userImage,
      @Freezed(fromJson: true) List<String> postImage,
      @Freezed(fromJson: true) List<String> liked,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? userName = null,
    Object? userId = null,
    Object? text = null,
    Object? posterRef = null,
    Object? userImage = null,
    Object? postImage = null,
    Object? liked = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      posterRef: null == posterRef
          ? _value.posterRef
          : posterRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: null == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String userName,
      String userId,
      String text,
      @DocumentReferenceConverter() DocumentReference<Object?> posterRef,
      String userImage,
      @Freezed(fromJson: true) List<String> postImage,
      @Freezed(fromJson: true) List<String> liked,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? userName = null,
    Object? userId = null,
    Object? text = null,
    Object? posterRef = null,
    Object? userImage = null,
    Object? postImage = null,
    Object? liked = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Post(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      posterRef: null == posterRef
          ? _value.posterRef
          : posterRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: null == postImage
          ? _value._postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      liked: null == liked
          ? _value._liked
          : liked // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {required this.id,
      required this.creatorId,
      required this.userName,
      required this.userId,
      required this.text,
      @DocumentReferenceConverter() required this.posterRef,
      this.userImage = '',
      @Freezed(fromJson: true) final List<String> postImage = const [],
      @Freezed(fromJson: true) final List<String> liked = const [],
      @TimestampConverter() required this.createdAt})
      : _postImage = postImage,
        _liked = liked;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String id;
  @override
  final String creatorId;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String text;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> posterRef;
  @override
  @JsonKey()
  final String userImage;
  final List<String> _postImage;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get postImage {
    if (_postImage is EqualUnmodifiableListView) return _postImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postImage);
  }

  final List<String> _liked;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get liked {
    if (_liked is EqualUnmodifiableListView) return _liked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liked);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Post(id: $id, creatorId: $creatorId, userName: $userName, userId: $userId, text: $text, posterRef: $posterRef, userImage: $userImage, postImage: $postImage, liked: $liked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.posterRef, posterRef) ||
                other.posterRef == posterRef) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            const DeepCollectionEquality()
                .equals(other._postImage, _postImage) &&
            const DeepCollectionEquality().equals(other._liked, _liked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      userName,
      userId,
      text,
      posterRef,
      userImage,
      const DeepCollectionEquality().hash(_postImage),
      const DeepCollectionEquality().hash(_liked),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String creatorId,
      required final String userName,
      required final String userId,
      required final String text,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> posterRef,
      final String userImage,
      @Freezed(fromJson: true)
          final List<String> postImage,
      @Freezed(fromJson: true)
          final List<String> liked,
      @TimestampConverter()
          required final Timestamp createdAt}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id;
  @override
  String get creatorId;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get text;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get posterRef;
  @override
  String get userImage;
  @override
  @Freezed(fromJson: true)
  List<String> get postImage;
  @override
  @Freezed(fromJson: true)
  List<String> get liked;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
