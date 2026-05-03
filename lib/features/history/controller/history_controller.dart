import 'package:get/get.dart';

class HistoryController extends GetxController {
  final searchQuery = ''.obs;

  final List<Map<String, dynamic>> history = [
    {
      'role': 'Flutter Developer',
      'industry': 'Technology',
      'score': 78,
      'time': '2h ago',
    },
    {
      'role': 'AWS Cloud Engineer',
      'industry': 'Technology',
      'score': 65,
      'time': 'Yesterday',
    },
    {
      'role': 'Full Stack Developer',
      'industry': 'Startup',
      'score': 45,
      'time': '3 days ago',
    },
    {
      'role': 'Python Developer',
      'industry': 'Finance',
      'score': 82,
      'time': '1 week ago',
    },
    {
      'role': 'DevOps Engineer',
      'industry': 'Technology',
      'score': 55,
      'time': '2 weeks ago',
    },
  ];

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