import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';

class ResourceSection extends StatelessWidget {
  const ResourceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.resources,
          style: AppTextStyles.titleLarge,
        )
        .animate()
        .fadeIn(delay: 500.ms),

        const SizedBox(height: AppDimensions.paddingM),

        Row(
          children: [
            _buildResourceCard(
              Icons.lightbulb_rounded,
              AppStrings.tips,
            ),
            const SizedBox(width: AppDimensions.paddingM),
            _buildResourceCard(
              Icons.quiz_rounded,
              AppStrings.questions,
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 600.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildResourceCard(IconData icon, String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.cardLight,
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: AppDimensions.paddingS),
            Text(
              title,
              style: AppTextStyles.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}