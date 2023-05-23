// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Thread _$ThreadFromJson(Map<String, dynamic> json) {
  return _Thread.fromJson(json);
}

/// @nodoc
mixin _$Thread {
  Map<String, List<String>> get unreadCount =>
      throw _privateConstructorUsedError;
  String get latestChat => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get memberIds => throw _privateConstructorUsedError;
  @MemberDetailConverter()
  Map<String, MemberDetail> get memberDetails =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  /// クライアントのみで扱うデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadCopyWith<Thread> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadCopyWith<$Res> {
  factory $ThreadCopyWith(Thread value, $Res Function(Thread) then) =
      _$ThreadCopyWithImpl<$Res, Thread>;
  @useResult
  $Res call(
      {Map<String, List<String>> unreadCount,
      String latestChat,
      @Freezed(fromJson: true) List<String> memberIds,
      @MemberDetailConverter() Map<String, MemberDetail> memberDetails,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class _$ThreadCopyWithImpl<$Res, $Val extends Thread>
    implements $ThreadCopyWith<$Res> {
  _$ThreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
    Object? latestChat = null,
    Object? memberIds = null,
    Object? memberDetails = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      latestChat: null == latestChat
          ? _value.latestChat
          : latestChat // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _value.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberDetails: null == memberDetails
          ? _value.memberDetails
          : memberDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, MemberDetail>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThreadCopyWith<$Res> implements $ThreadCopyWith<$Res> {
  factory _$$_ThreadCopyWith(_$_Thread value, $Res Function(_$_Thread) then) =
      __$$_ThreadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<String>> unreadCount,
      String latestChat,
      @Freezed(fromJson: true) List<String> memberIds,
      @MemberDetailConverter() Map<String, MemberDetail> memberDetails,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      @DocumentReferenceConverter() DocumentReference<Object?>? reference});
}

/// @nodoc
class __$$_ThreadCopyWithImpl<$Res>
    extends _$ThreadCopyWithImpl<$Res, _$_Thread>
    implements _$$_ThreadCopyWith<$Res> {
  __$$_ThreadCopyWithImpl(_$_Thread _value, $Res Function(_$_Thread) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
    Object? latestChat = null,
    Object? memberIds = null,
    Object? memberDetails = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? reference = freezed,
  }) {
    return _then(_$_Thread(
      unreadCount: null == unreadCount
          ? _value._unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      latestChat: null == latestChat
          ? _value.latestChat
          : latestChat // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _value._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberDetails: null == memberDetails
          ? _value._memberDetails
          : memberDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, MemberDetail>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
class _$_Thread extends _Thread {
  const _$_Thread(
      {final Map<String, List<String>> unreadCount = const {},
      this.latestChat = '',
      @Freezed(fromJson: true)
          final List<String> memberIds = const [],
      @MemberDetailConverter()
          required final Map<String, MemberDetail> memberDetails,
      @TimestampConverter()
          required this.createdAt,
      @TimestampConverter()
          required this.updatedAt,
      @DocumentReferenceConverter()
          this.reference})
      : _unreadCount = unreadCount,
        _memberIds = memberIds,
        _memberDetails = memberDetails,
        super._();

  factory _$_Thread.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadFromJson(json);

  final Map<String, List<String>> _unreadCount;
  @override
  @JsonKey()
  Map<String, List<String>> get unreadCount {
    if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unreadCount);
  }

  @override
  @JsonKey()
  final String latestChat;
  final List<String> _memberIds;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  final Map<String, MemberDetail> _memberDetails;
  @override
  @MemberDetailConverter()
  Map<String, MemberDetail> get memberDetails {
    if (_memberDetails is EqualUnmodifiableMapView) return _memberDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_memberDetails);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  /// クライアントのみで扱うデータ
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Object?>? reference;

  @override
  String toString() {
    return 'Thread(unreadCount: $unreadCount, latestChat: $latestChat, memberIds: $memberIds, memberDetails: $memberDetails, createdAt: $createdAt, updatedAt: $updatedAt, reference: $reference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Thread &&
            const DeepCollectionEquality()
                .equals(other._unreadCount, _unreadCount) &&
            (identical(other.latestChat, latestChat) ||
                other.latestChat == latestChat) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
            const DeepCollectionEquality()
                .equals(other._memberDetails, _memberDetails) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_unreadCount),
      latestChat,
      const DeepCollectionEquality().hash(_memberIds),
      const DeepCollectionEquality().hash(_memberDetails),
      createdAt,
      updatedAt,
      reference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThreadCopyWith<_$_Thread> get copyWith =>
      __$$_ThreadCopyWithImpl<_$_Thread>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreadToJson(
      this,
    );
  }
}

abstract class _Thread extends Thread {
  const factory _Thread(
      {final Map<String, List<String>> unreadCount,
      final String latestChat,
      @Freezed(fromJson: true)
          final List<String> memberIds,
      @MemberDetailConverter()
          required final Map<String, MemberDetail> memberDetails,
      @TimestampConverter()
          required final Timestamp createdAt,
      @TimestampConverter()
          required final Timestamp updatedAt,
      @DocumentReferenceConverter()
          final DocumentReference<Object?>? reference}) = _$_Thread;
  const _Thread._() : super._();

  factory _Thread.fromJson(Map<String, dynamic> json) = _$_Thread.fromJson;

  @override
  Map<String, List<String>> get unreadCount;
  @override
  String get latestChat;
  @override
  @Freezed(fromJson: true)
  List<String> get memberIds;
  @override
  @MemberDetailConverter()
  Map<String, MemberDetail> get memberDetails;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override

  /// クライアントのみで扱うデータ
  @DocumentReferenceConverter()
  DocumentReference<Object?>? get reference;
  @override
  @JsonKey(ignore: true)
  _$$_ThreadCopyWith<_$_Thread> get copyWith =>
      throw _privateConstructorUsedError;
}
