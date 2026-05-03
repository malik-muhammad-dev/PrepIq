import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';

class HistoryCard extends StatelessWidget {
  final String role;
  final String industry;
  final int score;
  final String time;
  final int index;

  const HistoryCard({
    super.key,
    required this.role,
    required this.industry,
    required this.score,
    required this.time,
    required this.index,
  });

  Color get scoreColor {
    if (score >= 70) return AppColors.success;
    if (score >= 50) return AppColors.warning;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        border: Border(
          left: BorderSide(color: scoreColor, width: 3),
        ),
      ),
      child: Row(
        children: [
          // Score circle
          SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 3,
                  backgroundColor: AppColors.cardLight,
                  valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
                ),
                Text(
                  '$score%',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: scoreColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: AppDimensions.paddingM),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
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
                    industry,
                    style: AppTextStyles.labelSmall,
                  ),
                ),
              ],
            ),
          ),

          // Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: AppTextStyles.labelSmall,
              ),
              const SizedBox(height: 4),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.textHint,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    )
    .animate()
    .fadeIn(delay: (index * 100).ms, duration: 500.ms)
    .slideX(begin: 0.2, end: 0, delay: (index * 100).ms);
  }
}