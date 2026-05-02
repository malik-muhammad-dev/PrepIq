import 'package:get/get.dart';
import 'package:prep_iq/features/onboarding/controler/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}