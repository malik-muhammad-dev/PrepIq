import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:prep_iq/shared/widgets/custom_textfeild.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: controller.goToLogin,
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Create Account 🚀',
                style: AppTextStyles.displayMedium,
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.3, end: 0, duration: 500.ms),

              const SizedBox(height: AppDimensions.paddingS),

              Text(
                'Start your AI interview journey today',
                style: AppTextStyles.bodyMedium,
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 500.ms),

              const SizedBox(height: AppDimensions.paddingXXL),

              // Form
              Form(
                key: controller.registerFormKey,
                child: Column(
                  children: [
                    // Full Name
                    CustomTextField(
                      hint: AppStrings.fullName,
                      prefixIcon: Icons.person_rounded,
                      controller: controller.nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.fieldRequired;
                        }
                        return null;
                      },
                    )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 500.ms)
                    .slideX(begin: -0.2, end: 0, delay: 300.ms),

                    const SizedBox(height: AppDimensions.paddingM),

                    // Email
                    CustomTextField(
                      hint: AppStrings.email,
                      prefixIcon: Icons.email_rounded,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.fieldRequired;
                        }
                        if (!GetUtils.isEmail(value)) {
                          return AppStrings.emailInvalid;
                        }
                        return null;
                      },
                    )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 500.ms)
                    .slideX(begin: -0.2, end: 0, delay: 400.ms),

                    const SizedBox(height: AppDimensions.paddingM),

                    // Password
                    Obx(() => CustomTextField(
                      hint: AppStrings.password,
                      prefixIcon: Icons.lock_rounded,
                      isPassword: true,
                      controller: controller.passwordController,
                      isPasswordVisible: controller.isPasswordVisible.value,
                      onPasswordToggle: controller.togglePasswordVisibility,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.fieldRequired;
                        }
                        if (value.length < 6) {
                          return AppStrings.passwordShort;
                        }
                        return null;
                      },
                    ))
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 500.ms)
                    .slideX(begin: -0.2, end: 0, delay: 500.ms),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Register button
                    Obx(() => GradientButton(
                      text: AppStrings.signUp,
                      isLoading: controller.isLoading.value,
                      onTap: controller.register,
                    ))
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 500.ms),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.haveAccount,
                          style: AppTextStyles.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: controller.goToLogin,
                          child: Text(
                            AppStrings.signIn,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 500.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}