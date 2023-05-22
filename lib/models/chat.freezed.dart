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
  String get senderUid => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get imageUrls => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get threadReference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// クライアントで使用するデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;

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
      String senderUid,
      @Freezed(fromJson: true) List<String> imageUrls,
      @DocumentReferenceConverter() DocumentReference<Object?> threadReference,
      @TimestampConverter() Timestamp createdAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
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
    Object? senderUid = null,
    Object? imageUrls = null,
    Object? threadReference = null,
    Object? createdAt = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      threadReference: null == threadReference
          ? _value.threadReference
          : threadReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
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
      String senderUid,
      @Freezed(fromJson: true) List<String> imageUrls,
      @DocumentReferenceConverter() DocumentReference<Object?> threadReference,
      @TimestampConverter() Timestamp createdAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
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
    Object? senderUid = null,
    Object? imageUrls = null,
    Object? threadReference = null,
    Object? createdAt = null,
    Object? reference = freezed,
  }) {
    return _then(_$_Chat(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      threadReference: null == threadReference
          ? _value.threadReference
          : threadReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat(
      {required this.text,
      required this.senderUid,
      @Freezed(fromJson: true) final List<String> imageUrls = const [],
      @DocumentReferenceConverter() required this.threadReference,
      @TimestampConverter() required this.createdAt,
      @DocumentReferenceConverter() this.reference})
      : _imageUrls = imageUrls;

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final String text;
  @override
  final String senderUid;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> threadReference;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  /// クライアントで使用するデータ
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? reference;

  @override
  String toString() {
    return 'Chat(text: $text, senderUid: $senderUid, imageUrls: $imageUrls, threadReference: $threadReference, createdAt: $createdAt, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.threadReference, threadReference) ||
                other.threadReference == threadReference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      senderUid,
      const DeepCollectionEquality().hash(_imageUrls),
      threadReference,
      createdAt,
      reference);

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
      required final String senderUid,
      @Freezed(fromJson: true)
          final List<String> imageUrls,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> threadReference,
      @TimestampConverter()
          required final Timestamp createdAt,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? reference}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get text;
  @override
  String get senderUid;
  @override
  @Freezed(fromJson: true)
  List<String> get imageUrls;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get threadReference;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override

  /// クライアントで使用するデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
