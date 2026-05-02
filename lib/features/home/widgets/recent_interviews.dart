import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
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
            Text(
              AppStrings.viewAll,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 700.ms),

        const SizedBox(height: AppDimensions.paddingM),

        ...List.generate(3, (index) {
          final scores = [10, 68, 40];
          final roles = [
            'Senior UI/UX Designer',
            'Junior Product Designer',
            'Senior UI/UX Designer',
          ];
          final times = ['Just now', '2h ago', '3 days ago'];
          final score = scores[index];
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
              borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
              border: Border(
                left: BorderSide(color: color, width: 3),
              ),
            ),
            child: Row(
              children: [
                // Score circle
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
                        valueColor: AlwaysStoppedAnimation<Color>(color),
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

                // Role info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roles[index],
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
                          'Job post',
                          style: AppTextStyles.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  times[index],
                  style: AppTextStyles.labelSmall,
                ),
              ],
            ),
          )
          .animate()
          .fadeIn(
            delay: (700 + (index * 100)).ms,
            duration: 500.ms,
          )
          .slideX(
            begin: 0.2,
            end: 0,
            delay: (700 + (index * 100)).ms,
          );
        }),
      ],
    );
  }
}