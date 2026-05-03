import 'package:get/get.dart';
import 'package:prep_iq/core/constants/app_colors.dart';
import '../../../app/routes.dart';

class ResultsController extends GetxController {
  final score = 78.obs;

  void tryAgain() {
    Get.offNamed(AppRoutes.home);
  }

  void shareResult() {
    Get.snackbar(
      'Coming Soon',
      'Share feature will be available soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.textPrimary,
    );
  }
}