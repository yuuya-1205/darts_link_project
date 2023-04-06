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
  String get id => throw _privateConstructorUsedError;
  bool get isReading => throw _privateConstructorUsedError;
  String get lastChat => throw _privateConstructorUsedError;
  @Freezed(fromJson: true)
  List<String> get uids => throw _privateConstructorUsedError;
  @Freezed(toJson: true)
  Map<String, dynamic> get memberDetails => throw _privateConstructorUsedError;
  @Freezed(toJson: true)
  Map<String, int> get unReadCount => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

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
      {String id,
      bool isReading,
      String lastChat,
      @Freezed(fromJson: true) List<String> uids,
      @Freezed(toJson: true) Map<String, dynamic> memberDetails,
      @Freezed(toJson: true) Map<String, int> unReadCount,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
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
    Object? id = null,
    Object? isReading = null,
    Object? lastChat = null,
    Object? uids = null,
    Object? memberDetails = null,
    Object? unReadCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isReading: null == isReading
          ? _value.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastChat: null == lastChat
          ? _value.lastChat
          : lastChat // ignore: cast_nullable_to_non_nullable
              as String,
      uids: null == uids
          ? _value.uids
          : uids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberDetails: null == memberDetails
          ? _value.memberDetails
          : memberDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      unReadCount: null == unReadCount
          ? _value.unReadCount
          : unReadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
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
}

/// @nodoc
abstract class _$$_ThreadCopyWith<$Res> implements $ThreadCopyWith<$Res> {
  factory _$$_ThreadCopyWith(_$_Thread value, $Res Function(_$_Thread) then) =
      __$$_ThreadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isReading,
      String lastChat,
      @Freezed(fromJson: true) List<String> uids,
      @Freezed(toJson: true) Map<String, dynamic> memberDetails,
      @Freezed(toJson: true) Map<String, int> unReadCount,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
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
    Object? id = null,
    Object? isReading = null,
    Object? lastChat = null,
    Object? uids = null,
    Object? memberDetails = null,
    Object? unReadCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Thread(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isReading: null == isReading
          ? _value.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastChat: null == lastChat
          ? _value.lastChat
          : lastChat // ignore: cast_nullable_to_non_nullable
              as String,
      uids: null == uids
          ? _value._uids
          : uids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      memberDetails: null == memberDetails
          ? _value._memberDetails
          : memberDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      unReadCount: null == unReadCount
          ? _value._unReadCount
          : unReadCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
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
class _$_Thread extends _Thread {
  const _$_Thread(
      {required this.id,
      required this.isReading,
      this.lastChat = '',
      @Freezed(fromJson: true)
          final List<String> uids = const [],
      @Freezed(toJson: true)
          final Map<String, dynamic> memberDetails = const {},
      @Freezed(toJson: true)
          final Map<String, int> unReadCount = const {},
      @TimestampConverter()
          required this.createdAt,
      @TimestampConverter()
          required this.updatedAt})
      : _uids = uids,
        _memberDetails = memberDetails,
        _unReadCount = unReadCount,
        super._();

  factory _$_Thread.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadFromJson(json);

  @override
  final String id;
  @override
  final bool isReading;
  @override
  @JsonKey()
  final String lastChat;
  final List<String> _uids;
  @override
  @JsonKey()
  @Freezed(fromJson: true)
  List<String> get uids {
    if (_uids is EqualUnmodifiableListView) return _uids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uids);
  }

  final Map<String, dynamic> _memberDetails;
  @override
  @JsonKey()
  @Freezed(toJson: true)
  Map<String, dynamic> get memberDetails {
    if (_memberDetails is EqualUnmodifiableMapView) return _memberDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_memberDetails);
  }

  final Map<String, int> _unReadCount;
  @override
  @JsonKey()
  @Freezed(toJson: true)
  Map<String, int> get unReadCount {
    if (_unReadCount is EqualUnmodifiableMapView) return _unReadCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unReadCount);
  }

  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'Thread(id: $id, isReading: $isReading, lastChat: $lastChat, uids: $uids, memberDetails: $memberDetails, unReadCount: $unReadCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Thread &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isReading, isReading) ||
                other.isReading == isReading) &&
            (identical(other.lastChat, lastChat) ||
                other.lastChat == lastChat) &&
            const DeepCollectionEquality().equals(other._uids, _uids) &&
            const DeepCollectionEquality()
                .equals(other._memberDetails, _memberDetails) &&
            const DeepCollectionEquality()
                .equals(other._unReadCount, _unReadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isReading,
      lastChat,
      const DeepCollectionEquality().hash(_uids),
      const DeepCollectionEquality().hash(_memberDetails),
      const DeepCollectionEquality().hash(_unReadCount),
      createdAt,
      updatedAt);

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
      {required final String id,
      required final bool isReading,
      final String lastChat,
      @Freezed(fromJson: true) final List<String> uids,
      @Freezed(toJson: true) final Map<String, dynamic> memberDetails,
      @Freezed(toJson: true) final Map<String, int> unReadCount,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt}) = _$_Thread;
  const _Thread._() : super._();

  factory _Thread.fromJson(Map<String, dynamic> json) = _$_Thread.fromJson;

  @override
  String get id;
  @override
  bool get isReading;
  @override
  String get lastChat;
  @override
  @Freezed(fromJson: true)
  List<String> get uids;
  @override
  @Freezed(toJson: true)
  Map<String, dynamic> get memberDetails;
  @override
  @Freezed(toJson: true)
  Map<String, int> get unReadCount;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ThreadCopyWith<_$_Thread> get copyWith =>
      throw _privateConstructorUsedError;
}
