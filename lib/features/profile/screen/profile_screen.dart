import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../controller/profile_controller.dart';
import '../widgets/profile_stats_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          AppStrings.profile,
          style: AppTextStyles.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.paddingL),

            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
              ),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 50,
              ),
            )
            .animate()
            .fadeIn(duration: 500.ms)
            .scale(
              begin: const Offset(0.5, 0.5),
              end: const Offset(1, 1),
              duration: 500.ms,
              curve: Curves.elasticOut,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            // Name
         // Name
Obx(() => Text(
  controller.userName.value,
  style: AppTextStyles.displaySmall,
)),

const SizedBox(height: 4),

// Email
Obx(() => Text(
  controller.userEmail.value,
  style: AppTextStyles.bodyMedium,
)),
            const SizedBox(height: AppDimensions.paddingXL),

            // Stats card
            const ProfileStatsCard()
            .animate()
            .fadeIn(delay: 400.ms, duration: 500.ms)
            .slideY(begin: 0.2, end: 0, delay: 400.ms),

            const SizedBox(height: AppDimensions.paddingXL),


            // Settings options
            _buildOption(
              icon: Icons.person_outline_rounded,
              title: AppStrings.editProfile,
              onTap: () {},
            )
            .animate()
            .fadeIn(delay: 500.ms, duration: 500.ms),

            _buildOption(
              icon: Icons.history_rounded,
              title: AppStrings.interviewHistory,
              onTap: () => Get.toNamed(AppStrings.interviewHistory),
            )
            .animate()
            .fadeIn(delay: 600.ms, duration: 500.ms),

            _buildOption(
              icon: Icons.settings_rounded,
              title: AppStrings.settings,
              onTap: () {},
            )
            .animate()
            .fadeIn(delay: 700.ms, duration: 500.ms),

            _buildOption(
              icon: Icons.logout_rounded,
              title: AppStrings.logout,
              onTap: controller.logout,
              isDestructive: true,
            )
            .animate()
            .fadeIn(delay: 800.ms, duration: 500.ms),

            const SizedBox(height: AppDimensions.paddingXL),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.error.withOpacity(0.15)
                    : AppColors.cardLight,
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
              child: Icon(
                icon,
                color: isDestructive
                    ? AppColors.error
                    : AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: AppDimensions.paddingM),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.titleSmall.copyWith(
                  color: isDestructive
                      ? AppColors.error
                      : AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textHint,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}