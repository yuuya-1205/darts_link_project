import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/converters/document_reference_converter.dart';
import 'package:darts_link_project/converters/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String createrId,
    required String userName,
    required String userId,
    required String text,
    @DocumentReferenceConverter() required DocumentReference posterRef,
    @Default('') String userImage,
    @Freezed(fromJson: true) @Default([]) List<String> postImage,
    @Freezed(fromJson: true) @Default([]) List<String> liked,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
