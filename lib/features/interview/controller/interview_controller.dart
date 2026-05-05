import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/ai_service.dart';

class InterviewController extends GetxController {
  final AiService _aiService  = AiService();

  final isLoading = false.obs;
  final isListening = false.obs;
  final isGeneratingQuestions = false.obs;
  final currentQuestionIndex = 0.obs;
  final currentAnswer = ''.obs;

  final questions = <String>[].obs;
  final answers = <String>[].obs;
final answerTextController = TextEditingController();
  String role = '';
  String industry = '';

  bool get isLastQuestion =>
      currentQuestionIndex.value == questions.length - 1;

  @override
  void onInit() {
    super.onInit();
    // Get role and industry passed from home screen
    final args = Get.arguments as Map<String, String>?;
    role = args?['role'] ?? 'Software Developer';
    industry = args?['industry'] ?? 'Technology';
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
  isGeneratingQuestions.value = true;
  try {
    final generated = await _aiService .generateQuestions(
      role: role,
      industry: industry,
    );
    questions.assignAll(generated);
  } catch (e) {
    print('Gemini Error: $e');
    Get.snackbar(
      'Error',
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.error,
      colorText: AppColors.textPrimary,
      duration: const Duration(seconds: 5),
    );
    questions.assignAll(_aiService .getFallbackQuestions(role));
  } finally {
    isGeneratingQuestions.value = false;
  }
}

  void toggleListening() {
    isListening.value = !isListening.value;

    if (isListening.value) {
      // Simulate listening for now
      // Speech to text will replace this later
      Future.delayed(const Duration(seconds: 3), () {
        isListening.value = false;
        currentAnswer.value =
            'This is a simulated answer. Speech to text will be integrated soon.';
      });
    }
  }

  void nextQuestion() {
  if (currentAnswer.value.isEmpty) return;

  answers.add(currentAnswer.value);

  if (isLastQuestion) {
    _submitInterview();
  } else {
    currentQuestionIndex.value++;
    currentAnswer.value = '';
    answerTextController.clear();
  }
}

  Future<void> _submitInterview() async {
    isLoading.value = true;
    try {
      final analysis = await _aiService .analyzeInterview(
        role: role,
        questions: questions,
        answers: answers,
      );
      Get.offNamed(AppRoutes.results, arguments: analysis);
    } catch (e) {
      Get.offNamed(AppRoutes.results, arguments: {
        'score': 70,
        'strengths': ['Good effort', 'Keep practicing', 'Stay consistent'],
        'improvements': ['Need more depth', 'Be more specific', 'Practice more'],
        'suggestions': ['Study daily', 'Mock interviews', 'Real projects'],
      });
    } finally {
      isLoading.value = false;
    }
  }

 @override
void onClose() {
  answerTextController.dispose();
  super.onClose();
}
}