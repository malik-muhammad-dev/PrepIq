import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:prep_iq/features/ressults/controller/ressult_controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/custom_button.dart';
import '../widgets/score_circle.dart';
import '../widgets/feedback_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResultsController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.interviewComplete,
          style: AppTextStyles.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.paddingL),

            // Score circle
            Obx(() => ScoreCircle(score: controller.score.value)),

            const SizedBox(height: AppDimensions.paddingXXL),

            // Strengths card
          // Strengths card
// Strengths card
FeedbackCard(
  title: AppStrings.strengths,
  points: controller.strengths,
  icon: Icons.check_circle_rounded,
  color: AppColors.success,
  delay: 800,
),

const SizedBox(height: AppDimensions.paddingM),

// Improvements card
FeedbackCard(
  title: AppStrings.improvements,
  points: controller.improvements,
  icon: Icons.warning_rounded,
  color: AppColors.warning,
  delay: 1000,
),

const SizedBox(height: AppDimensions.paddingM),

// Suggestions card
FeedbackCard(
  title: AppStrings.suggestions,
  points: controller.suggestions,
  icon: Icons.lightbulb_rounded,
  color: AppColors.primary,
  delay: 1200,
),

            const SizedBox(height: AppDimensions.paddingXL),

            // Buttons
            GradientButton(
              text: AppStrings.tryAgain,
              onTap: controller.tryAgain,
            )
            .animate()
            .fadeIn(delay: 1400.ms, duration: 500.ms),

            const SizedBox(height: AppDimensions.paddingM),

            CustomButton(
              text: AppStrings.shareResult,
              onTap: controller.shareResult,
              isOutlined: true,
            )
            .animate()
            .fadeIn(delay: 1500.ms, duration: 500.ms),

            const SizedBox(height: AppDimensions.paddingXL),
          ],
        ),
      ),
    );
  }
}