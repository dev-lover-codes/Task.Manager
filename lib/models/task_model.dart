import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final DateTime date;
  final bool isCompleted;
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      isCompleted: map['isCompleted'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
