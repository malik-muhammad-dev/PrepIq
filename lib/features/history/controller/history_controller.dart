import 'package:get/get.dart';
import '../repository/history_repository.dart';

class HistoryController extends GetxController {
  final HistoryRepository _historyRepository = HistoryRepository();

  final searchQuery = ''.obs;
  final isLoading = false.obs;
  final history = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  Future<void> loadHistory() async {
    isLoading.value = true;
    try {
      final data = await _historyRepository.getHistory();
      history.assignAll(data);
    } catch (e) {
     
    } finally {
      isLoading.value = false;
    }
  }

  List<Map<String, dynamic>> get filteredHistory {
    if (searchQuery.value.isEmpty) return history;
    return history.where((item) {
      return (item['role'] as String)
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  void searchInterviews(String query) {
    searchQuery.value = query;
  }
}