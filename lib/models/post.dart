import 'package:agrilink/core/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
sealed class Post with _$Post {
  const factory Post({
    required String id,
    required String userId,
    required String title,
    required String description,
    required double fundingGoal,
    required double currentFunding,
    @TimestampConverter() required DateTime createdAt,
    required List<String> images,
    required String category,
    required String location,
    required String status,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json, String id) =>
      _$PostFromJson(json);
}
