import 'package:get/instance_manager.dart';
import 'package:prep_iq/features/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Register the AuthController here
    Get.lazyPut<AuthController>(() => AuthController());
  }
}