import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';

class FeedbackCard extends StatelessWidget {
  final String title;
  final List<String> points;
  final IconData icon;
  final Color color;
  final int delay;

  const FeedbackCard({
    super.key,
    required this.title,
    required this.points,
    required this.icon,
    required this.color,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        border: Border(
          left: BorderSide(color: color, width: 3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: AppDimensions.paddingS),
              Text(
                title,
                style: AppTextStyles.titleMedium.copyWith(color: color),
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.paddingM),

          // Points
          ...points.map((point) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.paddingS),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  size: 6,
                  color: color,
                ),
                const SizedBox(width: AppDimensions.paddingS),
                Expanded(
                  child: Text(
                    point,
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    )
    .animate()
    .fadeIn(delay: delay.ms, duration: 500.ms)
    .slideY(begin: 0.2, end: 0, delay: delay.ms, duration: 500.ms);
  }
}