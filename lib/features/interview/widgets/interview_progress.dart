import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';

class InterviewProgress extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const InterviewProgress({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppStrings.question} $currentQuestion ${AppStrings.of} $totalQuestions',
              style: AppTextStyles.titleMedium,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
                vertical: AppDimensions.paddingXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
              ),
              child: Text(
                '${((currentQuestion / totalQuestions) * 100).toInt()}%',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppDimensions.paddingS),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          child: LinearProgressIndicator(
            value: currentQuestion / totalQuestions,
            backgroundColor: AppColors.cardBackground,
          valueColor: AlwaysStoppedAnimation<Color>(
  AppColors.primary,
),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}