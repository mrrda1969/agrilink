// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Investment _$InvestmentFromJson(Map<String, dynamic> json) => _Investment(
      id: json['id'] as String,
      investorId: json['investorId'] as String,
      farmerId: json['farmerId'] as String,
      postId: json['postId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$InvestmentToJson(_Investment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investorId': instance.investorId,
      'farmerId': instance.farmerId,
      'postId': instance.postId,
      'amount': instance.amount,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'notes': instance.notes,
    };
