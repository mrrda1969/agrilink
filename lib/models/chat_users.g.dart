// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatUsers _$ChatUsersFromJson(Map<String, dynamic> json) => _ChatUsers(
      name: json['name'] as String,
      messageText: json['messageText'] as String,
      imagePath: json['imagePath'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ChatUsersToJson(_ChatUsers instance) =>
    <String, dynamic>{
      'name': instance.name,
      'messageText': instance.messageText,
      'imagePath': instance.imagePath,
      'time': instance.time,
    };
