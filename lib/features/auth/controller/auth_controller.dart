import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await _authRepository.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Get.offAllNamed(AppRoutes.home);
      } catch (e) {
        Get.snackbar(
          'Login Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.textPrimary,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await _authRepository.register(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim(),
        );
        Get.offAllNamed(AppRoutes.home);
      } catch (e) {
        Get.snackbar(
          'Registration Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.textPrimary,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  void goToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}