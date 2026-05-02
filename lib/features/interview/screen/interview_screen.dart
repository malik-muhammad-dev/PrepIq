import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../controller/interview_controller.dart';
import '../widgets/interview_progress.dart';
import '../widgets/question_card.dart';
import '../widgets/mic_button.dart';

class InterviewScreen extends StatelessWidget {
  const InterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InterviewController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
        ),
        title: Text(
          AppStrings.interviewStarting,
          style: AppTextStyles.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.paddingL),
                    Text(
                      AppStrings.analyzing,
                      style: AppTextStyles.bodyMedium,
                    )
                    .animate(onPlay: (c) => c.repeat())
                    .fadeIn(duration: 800.ms)
                    .then()
                    .fadeOut(duration: 800.ms),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingM),
                child: Column(
                  children: [
                    // Progress
                    InterviewProgress(
                      currentQuestion: controller.currentQuestionIndex.value + 1,
                      totalQuestions: controller.questions.length,
                    ),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Question card
                    Expanded(
                      child: QuestionCard(
                        question: controller.questions[
                            controller.currentQuestionIndex.value],
                        questionNumber: controller.currentQuestionIndex.value,
                      ),
                    ),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Answer text area
                    Container(
                      width: double.infinity,
                      height: 120,
                      padding: const EdgeInsets.all(AppDimensions.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.cardRadius),
                      ),
                      child: Obx(() => Text(
                        controller.currentAnswer.value.isEmpty
                            ? 'Your answer will appear here...'
                            : controller.currentAnswer.value,
                        style: controller.currentAnswer.value.isEmpty
                            ? AppTextStyles.bodyMedium
                            : AppTextStyles.bodyLarge,
                      )),
                    ),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Mic button
                    Obx(() => MicButton(
                      isListening: controller.isListening.value,
                      onTap: controller.toggleListening,
                    )),

                    const SizedBox(height: AppDimensions.paddingXL),

                    // Next button
                    Obx(() => controller.currentAnswer.value.isNotEmpty
                        ? GradientButton(
                            text: controller.isLastQuestion
                                ? AppStrings.submitAnswer
                                : AppStrings.nextQuestion,
                            onTap: controller.nextQuestion,
                          )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        : const SizedBox()),

                    const SizedBox(height: AppDimensions.paddingM),
                  ],
                ),
              )),
      ),
    );
  }
}