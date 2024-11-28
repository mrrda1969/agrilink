import 'package:cloud_firestore/cloud_firestore.dart';

class Investment {
  final String id;
  final String investorId;
  final String farmerId;
  final String postId;
  final double amount;
  final String status; // 'pending', 'accepted', 'rejected'
  final DateTime createdAt;
  final String? notes;

  Investment({
    required this.id,
    required this.investorId,
    required this.farmerId,
    required this.postId,
    required this.amount,
    required this.status,
    required this.createdAt,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'investorId': investorId,
      'farmerId': farmerId,
      'postId': postId,
      'amount': amount,
      'status': status,
      'createdAt': createdAt,
      'notes': notes,
    };
  }

  static Investment fromMap(Map<String, dynamic> map, String documentId) {
    return Investment(
      id: documentId,
      investorId: map['investorId'],
      farmerId: map['farmerId'],
      postId: map['postId'],
      amount: map['amount'],
      status: map['status'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      notes: map['notes'],
    );
  }
}