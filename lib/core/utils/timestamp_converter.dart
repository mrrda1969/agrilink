import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    } else if (json is String) {
      return DateTime.parse(json);
    } else if (json is Map && json['_seconds'] != null) {
      return DateTime.fromMillisecondsSinceEpoch(json['_seconds'] * 1000);
    } else {
      throw Exception('Invalid format for Timestamp: $json');
    }
  }

  @override
  dynamic toJson(DateTime date) => Timestamp.fromDate(date);
}
