import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../app/routes.dart';
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
              context,
              Icons.lightbulb_rounded,
              AppStrings.tips,
              onTap: () => _showTips(context),
            ),
            const SizedBox(width: AppDimensions.paddingM),
            _buildResourceCard(
              context,
              Icons.quiz_rounded,
              AppStrings.questions,
              onTap: () => Get.toNamed(AppRoutes.history),
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 600.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildResourceCard(
    BuildContext context,
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
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
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: AppDimensions.paddingS),
              Text(title, style: AppTextStyles.titleSmall),
            ],
          ),
        ),
      ),
    );
  }

  void _showTips(BuildContext context) {
    final tips = [
      '🎯 Research the company before your interview',
      '💡 Use the STAR method for behavioral questions',
      '🗣️ Speak clearly and at a moderate pace',
      '👔 Dress professionally even for remote interviews',
      '❓ Always prepare questions to ask the interviewer',
      '⏰ Arrive or log in 5-10 minutes early',
      '🤝 Show enthusiasm and genuine interest in the role',
      '📝 Bring copies of your resume to in-person interviews',
      '💪 Highlight your achievements with specific numbers',
      '🧘 Take a deep breath and stay calm under pressure',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textHint,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
              ),
            ),

            const SizedBox(height: AppDimensions.paddingL),

            Text(
              '💡 Interview Tips',
              style: AppTextStyles.titleLarge,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tips.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimensions.paddingM,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.paddingS),
                      Expanded(
                        child: Text(
                          tips[index],
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}