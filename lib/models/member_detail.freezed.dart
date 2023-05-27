// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberDetail _$MemberDetailFromJson(Map<String, dynamic> json) {
  return _MemberDetail.fromJson(json);
}

/// @nodoc
mixin _$MemberDetail {
  String get userName => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberDetailCopyWith<MemberDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberDetailCopyWith<$Res> {
  factory $MemberDetailCopyWith(
          MemberDetail value, $Res Function(MemberDetail) then) =
      _$MemberDetailCopyWithImpl<$Res, MemberDetail>;
  @useResult
  $Res call({String userName, String userImage});
}

/// @nodoc
class _$MemberDetailCopyWithImpl<$Res, $Val extends MemberDetail>
    implements $MemberDetailCopyWith<$Res> {
  _$MemberDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userImage = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberDetailCopyWith<$Res>
    implements $MemberDetailCopyWith<$Res> {
  factory _$$_MemberDetailCopyWith(
          _$_MemberDetail value, $Res Function(_$_MemberDetail) then) =
      __$$_MemberDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String userImage});
}

/// @nodoc
class __$$_MemberDetailCopyWithImpl<$Res>
    extends _$MemberDetailCopyWithImpl<$Res, _$_MemberDetail>
    implements _$$_MemberDetailCopyWith<$Res> {
  __$$_MemberDetailCopyWithImpl(
      _$_MemberDetail _value, $Res Function(_$_MemberDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userImage = null,
  }) {
    return _then(_$_MemberDetail(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberDetail implements _MemberDetail {
  const _$_MemberDetail({required this.userName, required this.userImage});

  factory _$_MemberDetail.fromJson(Map<String, dynamic> json) =>
      _$$_MemberDetailFromJson(json);

  @override
  final String userName;
  @override
  final String userImage;

  @override
  String toString() {
    return 'MemberDetail(userName: $userName, userImage: $userImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberDetail &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, userImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberDetailCopyWith<_$_MemberDetail> get copyWith =>
      __$$_MemberDetailCopyWithImpl<_$_MemberDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberDetailToJson(
      this,
    );
  }
}

abstract class _MemberDetail implements MemberDetail {
  const factory _MemberDetail(
      {required final String userName,
      required final String userImage}) = _$_MemberDetail;

  factory _MemberDetail.fromJson(Map<String, dynamic> json) =
      _$_MemberDetail.fromJson;

  @override
  String get userName;
  @override
  String get userImage;
  @override
  @JsonKey(ignore: true)
  _$$_MemberDetailCopyWith<_$_MemberDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
