// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FcmToken _$FcmTokenFromJson(Map<String, dynamic> json) {
  return _FcmToken.fromJson(json);
}

/// @nodoc
mixin _$FcmToken {
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  @DocumentReferenceConverter()
  DocumentReference<Object?> get userReference =>
      throw _privateConstructorUsedError;
  List<String> get fcmTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmTokenCopyWith<FcmToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmTokenCopyWith<$Res> {
  factory $FcmTokenCopyWith(FcmToken value, $Res Function(FcmToken) then) =
      _$FcmTokenCopyWithImpl<$Res, FcmToken>;
  @useResult
  $Res call(
      {@TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?> userReference,
      List<String> fcmTokens});
}

/// @nodoc
class _$FcmTokenCopyWithImpl<$Res, $Val extends FcmToken>
    implements $FcmTokenCopyWith<$Res> {
  _$FcmTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userReference = null,
    Object? fcmTokens = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      userReference: null == userReference
          ? _value.userReference
          : userReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      fcmTokens: null == fcmTokens
          ? _value.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FcmTokenCopyWith<$Res> implements $FcmTokenCopyWith<$Res> {
  factory _$$_FcmTokenCopyWith(
          _$_FcmToken value, $Res Function(_$_FcmToken) then) =
      __$$_FcmTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?> userReference,
      List<String> fcmTokens});
}

/// @nodoc
class __$$_FcmTokenCopyWithImpl<$Res>
    extends _$FcmTokenCopyWithImpl<$Res, _$_FcmToken>
    implements _$$_FcmTokenCopyWith<$Res> {
  __$$_FcmTokenCopyWithImpl(
      _$_FcmToken _value, $Res Function(_$_FcmToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userReference = null,
    Object? fcmTokens = null,
  }) {
    return _then(_$_FcmToken(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      userReference: null == userReference
          ? _value.userReference
          : userReference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>,
      fcmTokens: null == fcmTokens
          ? _value._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FcmToken implements _FcmToken {
  _$_FcmToken(
      {@TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      @DocumentReferenceConverter() required this.userReference,
      required final List<String> fcmTokens})
      : _fcmTokens = fcmTokens;

  factory _$_FcmToken.fromJson(Map<String, dynamic> json) =>
      _$$_FcmTokenFromJson(json);

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?> userReference;
  final List<String> _fcmTokens;
  @override
  List<String> get fcmTokens {
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  @override
  String toString() {
    return 'FcmToken(createdAt: $createdAt, updatedAt: $updatedAt, userReference: $userReference, fcmTokens: $fcmTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FcmToken &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userReference, userReference) ||
                other.userReference == userReference) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, updatedAt,
      userReference, const DeepCollectionEquality().hash(_fcmTokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FcmTokenCopyWith<_$_FcmToken> get copyWith =>
      __$$_FcmTokenCopyWithImpl<_$_FcmToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FcmTokenToJson(
      this,
    );
  }
}

abstract class _FcmToken implements FcmToken {
  factory _FcmToken(
      {@TimestampConverter()
          required final Timestamp createdAt,
      @TimestampConverter()
          required final Timestamp updatedAt,
      @DocumentReferenceConverter()
          required final DocumentReference<Object?> userReference,
      required final List<String> fcmTokens}) = _$_FcmToken;

  factory _FcmToken.fromJson(Map<String, dynamic> json) = _$_FcmToken.fromJson;

  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Object?> get userReference;
  @override
  List<String> get fcmTokens;
  @override
  @JsonKey(ignore: true)
  _$$_FcmTokenCopyWith<_$_FcmToken> get copyWith =>
      throw _privateConstructorUsedError;
}
