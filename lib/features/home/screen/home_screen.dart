import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prep_iq/features/home/widgets/genrate_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../controller/home_controller.dart';
import '../widgets/home_header.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(controller: controller),
              const SizedBox(height: AppDimensions.paddingXL),
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