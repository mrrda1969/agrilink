import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userId;
  final String title;
  final String description;
  final double fundingGoal;
  final double currentFunding;
  final DateTime createdAt;
  final List<String> images;
  final String category;
  final String location;
  final String status; // 'open', 'funded', 'closed'

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.fundingGoal,
    required this.currentFunding,
    required this.createdAt,
    required this.images,
    required this.category,
    required this.location,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'fundingGoal': fundingGoal,
      'currentFunding': currentFunding,
      'createdAt': createdAt,
      'images': images,
      'category': category,
      'location': location,
      'status': status,
    };
  }

  static Post fromMap(Map<String, dynamic> map, String documentId) {
    return Post(
      id: documentId,
      userId: map['userId'],
      title: map['title'],
      description: map['description'],
      fundingGoal: map['fundingGoal'],
      currentFunding: map['currentFunding'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      images: List<String>.from(map['images']),
      category: map['category'],
      location: map['location'],
      status: map['status'],
    );
  }
}