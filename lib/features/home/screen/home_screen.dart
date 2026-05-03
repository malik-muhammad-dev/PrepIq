import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prep_iq/app/routes.dart';
import 'package:prep_iq/core/constants/app_text_styles.dart';
import 'package:prep_iq/features/home/widgets/genrate_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../controller/home_controller.dart';
import '../widgets/select_role_card.dart';
import '../widgets/resource_section.dart';
import '../widgets/recent_interviews.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back 👋',
              style: AppTextStyles.bodyMedium,
            ),
            Text(
              'PrepIQ',
              style: AppTextStyles.titleLarge,
            ),
          ],
        ),
      actions: [
  // History icon
  IconButton(
    onPressed: () => Get.toNamed(AppRoutes.history),
    icon: const Icon(
      Icons.history_rounded,
      color: AppColors.textPrimary,
      size: 22,
    ),
  ),

  // Avatar
  Padding(
    padding: const EdgeInsets.only(right: AppDimensions.paddingM),
    child: GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.profile),
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
        ),
        child: const Icon(
          Icons.person_rounded,
          color: Colors.white,
          size: 18,
        ),
      ),
    ),
  ),
],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectRoleCard(controller: controller),
              const SizedBox(height: AppDimensions.paddingL),
              GenerateButton(controller: controller),
              const SizedBox(height: AppDimensions.paddingXL),
              const ResourceSection(),
              const SizedBox(height: AppDimensions.paddingXL),
              RecentInterviews(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}