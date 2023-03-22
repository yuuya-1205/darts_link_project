// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get text => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get imageUrls => throw _privateConstructorUsedError;
  @Freezed(toJson: true)
  Map<String, bool> get isReading => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get reference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String text,
      String uid,
      String threadId,
      @Freezed(fromJson: true) List<String> imageUrls,
      @Freezed(toJson: true) Map<String, bool> isReading,
      @DocumentReferenceConverter() DocumentReference<Object?> reference,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? uid = null,
    Object? threadId = null,
    Object? imageUrls = null,
    Object? isReading = null,
    Object? reference = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      threadId: null == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReading: null == isReading
          ? _value.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String uid,
      String threadId,
      @Freezed(fromJson: true) List<String> imageUrls,
      @Freezed(toJson: true) Map<String, bool> isReading,
      @DocumentReferenceConverter() DocumentReference<Object?> reference,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? uid = null,
    Object? threadId = null,
    Object? imageUrls = null,
    Object? isReading = null,
    Object? reference = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Chat(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      threadId: null == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReading: null == isReading
          ? _value._isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat(
      {required this.text,
      required this.uid,
      required this.threadId,
      @Freezed(fromJson: true) final List<String> imageUrls = const [],
      @Freezed(toJson: true) final Map<String, bool> isReading = const {},
      @DocumentReferenceConverter() required this.reference,
      @TimestampConverter() required this.createdAt})
      : _imageUrls = imageUrls,
        _isReading = isReading;

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final String text;
  @override
  final String uid;
  @override
  final String threadId;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final Map<String, bool> _isReading;
  @override
  @JsonKey()
  @Freezed(toJson: true)
  Map<String, bool> get isReading {
    if (_isReading is EqualUnmodifiableMapView) return _isReading;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isReading);
  }

  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> reference;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'Chat(text: $text, uid: $uid, threadId: $threadId, imageUrls: $imageUrls, isReading: $isReading, reference: $reference, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._isReading, _isReading) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      uid,
      threadId,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_isReading),
      reference,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String text,
      required final String uid,
      required final String threadId,
      @Freezed(fromJson: true)
          final List<String> imageUrls,
      @Freezed(toJson: true)
          final Map<String, bool> isReading,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> reference,
      @TimestampConverter()
          required final Timestamp createdAt}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get text;
  @override
  String get uid;
  @override
  String get threadId;
  @override
  @Freezed(fromJson: true)
  List<String> get imageUrls;
  @override
  @Freezed(toJson: true)
  Map<String, bool> get isReading;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get reference;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
