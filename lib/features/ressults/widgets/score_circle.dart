import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';

class ScoreCircle extends StatelessWidget {
  final int score;

  const ScoreCircle({super.key, required this.score});

  Color get scoreColor {
    if (score >= 70) return AppColors.success;
    if (score >= 50) return AppColors.warning;
    return AppColors.error;
  }

  String get scoreLabel {
    if (score >= 70) return 'Great Job!';
    if (score >= 50) return 'Good Effort!';
    return 'Keep Practicing!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  value: 1,
                  strokeWidth: 12,
                  backgroundColor: AppColors.cardBackground,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.cardBackground,
                  ),
                ),
              ),

              // Score arc
              SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 12,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
                  strokeCap: StrokeCap.round,
                ),
              )
              .animate()
              .custom(
                duration: 1500.ms,
                curve: Curves.easeOut,
                builder: (context, value, child) => child!,
              ),

              // Score text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$score',
                    style: AppTextStyles.scoreDisplay.copyWith(
                      color: scoreColor,
                    ),
                  ),
                  Text(
                    'out of 100',
                    style: AppTextStyles.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .scale(
          begin: const Offset(0.5, 0.5),
          end: const Offset(1, 1),
          duration: 600.ms,
          curve: Curves.elasticOut,
        ),

        const SizedBox(height: AppDimensions.paddingM),

        Text(
          scoreLabel,
          style: AppTextStyles.titleLarge.copyWith(
            color: scoreColor,
          ),
        )
        .animate()
        .fadeIn(delay: 600.ms, duration: 500.ms),
      ],
    );
  }
}