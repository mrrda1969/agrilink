import 'package:agrilink/core/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment.freezed.dart';

part 'investment.g.dart';

@freezed
sealed class Investment with _$Investment {
  const factory Investment({
    required String id,
    required String investorId,
    required String farmerId,
    required String postId,
    required double amount,
    required String status, // 'pending', 'accepted', 'rejected'
    @TimestampConverter() required DateTime createdAt,
    String? notes,
  }) = _Investment;

  factory Investment.fromJson(Map<String, dynamic> json, String id) =>
      _$InvestmentFromJson(json);
}
