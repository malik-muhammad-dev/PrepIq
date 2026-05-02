import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Practice Like It\'s Real',
      'subtitle': 'AI powered mock interviews that feel exactly like the real thing',
      'icon': Icons.psychology_rounded,
    },
    {
      'title': 'Speak Your Answers',
      'subtitle': 'Just talk naturally, our AI listens and evaluates every word',
      'icon': Icons.mic_rounded,
    },
    {
      'title': 'Know Where You Stand',
      'subtitle': 'Get instant scores, feedback and tips to improve fast',
      'icon': Icons.insights_rounded,
    },
  ];

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      skipOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}