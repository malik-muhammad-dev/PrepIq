import 'package:get/get.dart';
import 'package:prep_iq/features/auth/screen/login_screen.dart';
import 'package:prep_iq/features/auth/screen/register_screen.dart';
import 'package:prep_iq/features/ressults/binding/ressult_binding.dart';
import 'package:prep_iq/features/ressults/screen/ressult_screen.dart';
import '../features/splash/binding/splash_binding.dart';
import '../features/splash/screen/splash_screen.dart';
import '../features/onboarding/binding/onboarding_binding.dart';
import '../features/onboarding/screen/onboarding_screen.dart';
import '../features/auth/binding/auth_binding.dart';

import '../features/home/binding/home_binding.dart';
import '../features/home/screen/home_screen.dart';
import '../features/interview/binding/interview_binding.dart';
import '../features/interview/screen/interview_screen.dart';

import '../features/history/binding/history_binding.dart';
import '../features/history/screen/history_screen.dart';
import '../features/profile/binding/profile_binding.dart';
import '../features/profile/screen/profile_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash      = '/';
  static const String onboarding  = '/onboarding';
  static const String login       = '/login';
  static const String register    = '/register';
  static const String home        = '/home';
  static const String interview   = '/interview';
  static const String results     = '/results';
  static const String history     = '/history';
  static const String profile     = '/profile';

  // Route Pages
  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: interview,
      page: () => const InterviewScreen(),
      binding: InterviewBinding(),
    ),
    GetPage(
      name: results,
      page: () => const ResultsScreen(),
      binding: ResultsBinding(),
    ),
    GetPage(
      name: history,
      page: () => const HistoryScreen(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}