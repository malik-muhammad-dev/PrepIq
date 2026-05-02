import 'package:get/get.dart';
import '../../../app/routes.dart';

class InterviewController extends GetxController {
  final isLoading = false.obs;
  final isListening = false.obs;
  final currentQuestionIndex = 0.obs;
  final currentAnswer = ''.obs;

  // Dummy questions for now — Gemini will replace these
  final List<String> questions = [
    'Tell me about yourself and your experience as a Flutter developer.',
    'How do you handle state management in Flutter? Which approach do you prefer and why?',
    'Can you explain the difference between StatelessWidget and StatefulWidget?',
    'How do you optimize Flutter app performance?',
    'Describe a challenging project you worked on and how you solved the problems.',
  ];

  bool get isLastQuestion =>
      currentQuestionIndex.value == questions.length - 1;

  void toggleListening() {
    isListening.value = !isListening.value;

    if (isListening.value) {
      // Simulate listening — speech_to_text will replace this
      Future.delayed(const Duration(seconds: 3), () {
        isListening.value = false;
        currentAnswer.value =
            'This is a simulated answer. Speech to text will be integrated here when we add the package later.';
      });
    }
  }

  void nextQuestion() {
    if (isLastQuestion) {
      _submitInterview();
    } else {
      currentQuestionIndex.value++;
      currentAnswer.value = '';
    }
  }

  void _submitInterview() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offNamed(AppRoutes.results);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}