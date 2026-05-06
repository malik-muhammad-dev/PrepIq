import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../auth/repository/auth_repository.dart';
import '../../history/repository/history_repository.dart';

class ProfileController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final HistoryRepository _historyRepository = HistoryRepository();

  final userName = ''.obs;
  final userEmail = ''.obs;
  final totalInterviews = 0.obs;
  final averageScore = 0.obs;
  final bestScore = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
    _loadStats();
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;
    userName.value = user?.displayName ?? 'User';
    userEmail.value = user?.email ?? '';
  }

  Future<void> _loadStats() async {
    try {
      final history = await _historyRepository.getHistory();
      if (history.isEmpty) return;

      totalInterviews.value = history.length;

      final scores = history.map((h) => h['score'] as int).toList();
      averageScore.value =
          (scores.reduce((a, b) => a + b) / scores.length).round();
      bestScore.value = scores.reduce((a, b) => a > b ? a : b);
    } catch (e) {
    
    }
  }

  void logout() {
    _authRepository.logout();
  }
}