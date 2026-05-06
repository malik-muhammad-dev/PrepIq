import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../app/routes.dart';
import '../controller/home_controller.dart';

class RecentInterviews extends StatelessWidget {
  final HomeController controller;

  const RecentInterviews({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.recentInterviews,
              style: AppTextStyles.titleLarge,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.history),
              child: Text(
                AppStrings.viewAll,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 700.ms),

        const SizedBox(height: AppDimensions.paddingM),

        Obx(() {
          if (controller.isLoadingHistory.value) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            );
          }

          if (controller.recentInterviews.isEmpty) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.paddingXL),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.history_rounded,
                    color: AppColors.textHint,
                    size: 40,
                  ),
                  const SizedBox(height: AppDimensions.paddingS),
                  Text(
                    'No interviews yet',
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Start your first interview above',
                    style: AppTextStyles.labelMedium,
                  ),
                ],
              ),
            );
          }

          return Column(
            children: controller.recentInterviews.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final score = item['score'] as int;
              final color = score >= 70
                  ? AppColors.success
                  : score >= 50
                      ? AppColors.warning
                      : AppColors.error;

              return Container(
                margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
                padding: const EdgeInsets.all(AppDimensions.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.cardRadius),
                  border: Border(
                    left: BorderSide(color: color, width: 3),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: score / 100,
                            strokeWidth: 3,
                            backgroundColor: AppColors.cardLight,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(color),
                          ),
                          Text(
                            '$score%',
                            style: AppTextStyles.labelMedium.copyWith(
                              color: color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppDimensions.paddingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['role'] as String,
                            style: AppTextStyles.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardLight,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusFull,
                              ),
                            ),
                            child: Text(
                              item['industry'] as String,
                              style: AppTextStyles.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      item['time'] as String,
                      style: AppTextStyles.labelSmall,
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: (700 + (index * 100)).ms, duration: 500.ms)
              .slideX(begin: 0.2, end: 0, delay: (700 + (index * 100)).ms);
            }).toList(),
          );
        }),
      ],
    );
  }
}