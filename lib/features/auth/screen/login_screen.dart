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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.paddingXXL),

              // Header
              Text(
                'Welcome Back 👋',
                style: AppTextStyles.displayMedium,
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.3, end: 0, duration: 500.ms),

              const SizedBox(height: AppDimensions.paddingS),

              Text(
                'Login to continue your interview prep',
                style: AppTextStyles.bodyMedium,
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 500.ms),

              const SizedBox(height: AppDimensions.paddingXXL),

              // Form
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
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
                    .fadeIn(delay: 300.ms, duration: 500.ms)
                    .slideX(begin: -0.2, end: 0, delay: 300.ms),

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
                    .fadeIn(delay: 400.ms, duration: 500.ms)
                    .slideX(begin: -0.2, end: 0, delay: 400.ms),

                    const SizedBox(height: AppDimensions.paddingS),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPassword,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppDimensions.paddingL),

                    // Login button
                    Obx(() => GradientButton(
                      text: AppStrings.signIn,
                      isLoading: controller.isLoading.value,
                      onTap: controller.login,
                    ))
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 500.ms),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.noAccount,
                          style: AppTextStyles.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: controller.goToRegister,
                          child: Text(
                            AppStrings.signUp,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 500.ms),
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