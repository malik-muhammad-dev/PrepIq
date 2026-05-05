import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../controller/interview_controller.dart';
import '../widgets/interview_progress.dart';
import '../widgets/question_card.dart';

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
        child: Obx(() {
          // Show loading while generating questions
          if (controller.isGeneratingQuestions.value) {
            return Center(
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
                    'Generating your questions...',
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            );
          }

          // Show loading while analyzing
          if (controller.isLoading.value) {
            return Center(
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
                  ),
                ],
              ),
            );
          }

          // Show interview when questions are ready
          if (controller.questions.isEmpty) {
            return const SizedBox();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            child: Column(
              children: [
                // Progress
                InterviewProgress(
                  currentQuestion:
                      controller.currentQuestionIndex.value + 1,
                  totalQuestions: controller.questions.length,
                ),

                const SizedBox(height: AppDimensions.paddingXL),

                // Question card
                QuestionCard(
                  question: controller.questions[
                      controller.currentQuestionIndex.value],
                  questionNumber: controller.currentQuestionIndex.value,
                ),

                const SizedBox(height: AppDimensions.paddingXL),

                // Answer text area
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.cardRadius),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: controller.answerTextController,
                    maxLines: 5,
                    minLines: 3,
                    style: AppTextStyles.bodyLarge,
                    decoration: InputDecoration(
                      hintText: 'Type your answer here...',
                      hintStyle: AppTextStyles.bodyMedium,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      controller.currentAnswer.value = value;
                    },
                  ),
                ),

                const SizedBox(height: AppDimensions.paddingXL),

                // Next button
                Obx(() => controller.currentAnswer.value.isNotEmpty
                    ? GradientButton(
                        text: controller.isLastQuestion
                            ? AppStrings.submitAnswer
                            : AppStrings.nextQuestion,
                        onTap: controller.nextQuestion,
                      )
                    : const SizedBox()),

                const SizedBox(height: AppDimensions.paddingM),
              ],
            ),
          );
        }),
      ),
    );
  }
}