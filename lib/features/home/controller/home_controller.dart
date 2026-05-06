import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../history/repository/history_repository.dart';

class HomeController extends GetxController {
  final HistoryRepository _historyRepository = HistoryRepository();

  final selectedRole = ''.obs;
  final selectedIndustry = ''.obs;
  final recentInterviews = <Map<String, dynamic>>[].obs;
  final isLoadingHistory = false.obs;

  List<String> get rolesForSelectedIndustry {
    if (selectedIndustry.value.isEmpty) return [];
    return AppStrings.rolesByIndustry[selectedIndustry.value] ?? [];
  }

  void onIndustryChanged(String? industry) {
    selectedIndustry.value = industry ?? '';
    selectedRole.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    loadRecentInterviews();
  }

  Future<void> loadRecentInterviews() async {
    isLoadingHistory.value = true;
    try {
      final data = await _historyRepository.getHistory();
      recentInterviews.assignAll(data.take(3).toList());
    } catch (e) {

    } finally {
      isLoadingHistory.value = false;
    }
  }

  void generateInterview() {
    if (selectedRole.value.isEmpty || selectedIndustry.value.isEmpty) {
      Get.snackbar(
        'Select Role',
        'Please select an industry and job role first',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.textPrimary,
      );
      return;
    }
    Get.toNamed(
      AppRoutes.interview,
      arguments: {
        'role': selectedRole.value,
        'industry': selectedIndustry.value,
      },
    );
  }
}