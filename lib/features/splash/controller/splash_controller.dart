import 'package:get/get.dart';
import '../../../app/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(AppRoutes.onboarding);
  }

  @override
  void onClose() {
    super.onClose();
  }
}