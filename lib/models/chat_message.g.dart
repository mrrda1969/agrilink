// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
      messageContent: json['messageContent'] as String,
      messageType: json['messageType'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'messageContent': instance.messageContent,
      'messageType': instance.messageType,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp.toIso8601String(),
    };
