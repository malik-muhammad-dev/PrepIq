import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';

class HomeController extends GetxController {
  final selectedRole = ''.obs;
  final selectedIndustry = ''.obs;

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
    Get.toNamed(AppRoutes.interview);
  }
}