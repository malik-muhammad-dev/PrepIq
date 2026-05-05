import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class HomeController extends GetxController {
  final selectedRole = ''.obs;
  final selectedIndustry = ''.obs;

  List<String> get rolesForSelectedIndustry {
    if (selectedIndustry.value.isEmpty) return [];
    return AppStrings.rolesByIndustry[selectedIndustry.value] ?? [];
  }

  void onIndustryChanged(String? industry) {
    selectedIndustry.value = industry ?? '';
    selectedRole.value = '';
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