import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../controller/home_controller.dart';

class SelectRoleCard extends StatelessWidget {
  final HomeController controller;

  const SelectRoleCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs
          Row(
            children: [
              _buildTab('Job post', true),
              const SizedBox(width: AppDimensions.paddingS),
              _buildTab('Job role', false),
            ],
          ),

          const SizedBox(height: AppDimensions.paddingM),

          // Industry dropdown
         // Industry dropdown
Obx(() => _buildDropdown(
  hint: AppStrings.selectIndustry,
  value: controller.selectedIndustry.value.isEmpty
      ? null
      : controller.selectedIndustry.value,
  items: AppStrings.industries,
  onChanged: controller.onIndustryChanged,
)),

const SizedBox(height: AppDimensions.paddingS),

// Role dropdown — changes based on industry
Obx(() => _buildDropdown(
  hint: AppStrings.selectRole,
  value: controller.selectedRole.value.isEmpty
      ? null
      : controller.selectedRole.value,
  items: controller.rolesForSelectedIndustry,
  onChanged: (val) => controller.selectedRole.value = val ?? '',
)),
        ],
      ),
    )
    .animate()
    .fadeIn(delay: 300.ms, duration: 500.ms)
    .slideY(begin: 0.2, end: 0, delay: 300.ms);
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingM,
        vertical: AppDimensions.paddingS,
      ),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        title,
        style: AppTextStyles.labelLarge.copyWith(
          color: isActive ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingM,
        vertical: AppDimensions.paddingS,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: AppTextStyles.bodyMedium),
          isExpanded: true,
          dropdownColor: AppColors.cardLight,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textSecondary,
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: AppTextStyles.bodyLarge),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}