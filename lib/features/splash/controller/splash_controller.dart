import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../auth/repository/auth_repository.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));

    final authRepository = AuthRepository();

    if (authRepository.isLoggedIn) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}