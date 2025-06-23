// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      fundingGoal: (json['fundingGoal'] as num).toDouble(),
      currentFunding: (json['currentFunding'] as num).toDouble(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      location: json['location'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'fundingGoal': instance.fundingGoal,
      'currentFunding': instance.currentFunding,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'images': instance.images,
      'category': instance.category,
      'location': instance.location,
      'status': instance.status,
    };
