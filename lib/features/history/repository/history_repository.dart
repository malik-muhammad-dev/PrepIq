import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser?.uid ?? '';

  // Save interview result
  Future<void> saveInterview({
    required String role,
    required String industry,
    required int score,
    required List<String> strengths,
    required List<String> improvements,
    required List<String> suggestions,
  }) async {
    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('interviews')
          .add({
        'role': role,
        'industry': industry,
        'score': score,
        'strengths': strengths,
        'improvements': improvements,
        'suggestions': suggestions,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
  
    }
  }

  // Get interview history
  Future<List<Map<String, dynamic>>> getHistory() async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('interviews')
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        final timestamp = data['createdAt'] as Timestamp?;
        final date = timestamp?.toDate() ?? DateTime.now();
        final now = DateTime.now();
        final diff = now.difference(date);

        String time;
        if (diff.inMinutes < 60) {
          time = '${diff.inMinutes}m ago';
        } else if (diff.inHours < 24) {
          time = '${diff.inHours}h ago';
        } else {
          time = '${diff.inDays} days ago';
        }

        return {
          'role': data['role'] ?? '',
          'industry': data['industry'] ?? '',
          'score': data['score'] ?? 0,
          'strengths': List<String>.from(data['strengths'] ?? []),
          'improvements': List<String>.from(data['improvements'] ?? []),
          'suggestions': List<String>.from(data['suggestions'] ?? []),
          'time': time,
        };
      }).toList();
    } catch (e) {

      return [];
    }
  }
}