import 'package:get/get.dart';
import '../../../app/routes.dart';

class ProfileController extends GetxController {
  void logout() {
    Get.offAllNamed(AppRoutes.login);
  }
}