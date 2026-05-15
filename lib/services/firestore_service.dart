import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class FirestoreService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add Task
  Future<void> addTask(TaskModel task) async {
    try {
      await _db.collection('tasks').doc(task.id).set(task.toMap());
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  // Update Task
  Future<void> updateTask(TaskModel task) async {
    try {
      await _db.collection('tasks').doc(task.id).update(task.toMap());
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  // Delete Task
  Future<void> deleteTask(String taskId) async {
    try {
      await _db.collection('tasks').doc(taskId).delete();
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  // Get Tasks (Stream) - Security Requirement: Filter by userId
  Stream<List<TaskModel>> getTasks(String userId) {
    return _db
        .collection('tasks')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => TaskModel.fromMap(doc.data()))
          .toList();
    });
  }
}
