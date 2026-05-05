import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';

class ResultsController extends GetxController {
  final score = 0.obs;
  final strengths = <String>[].obs;
  final improvements = <String>[].obs;
  final suggestions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      score.value = args['score'] as int? ?? 70;
      strengths.assignAll(
        List<String>.from(args['strengths'] ?? []),
      );
      improvements.assignAll(
        List<String>.from(args['improvements'] ?? []),
      );
      suggestions.assignAll(
        List<String>.from(args['suggestions'] ?? []),
      );
    }
  }

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