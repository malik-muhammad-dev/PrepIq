import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Container
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gradientStart.withOpacity(0.4),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.psychology_rounded,
                color: Colors.white,
                size: 60,
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

            const SizedBox(height: AppDimensions.paddingL),

            // App Name
            Text(
              'PrepIQ',
              style: AppTextStyles.displayLarge,
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms)
            .slideY(
              begin: 0.3,
              end: 0,
              delay: 400.ms,
              duration: 500.ms,
              curve: Curves.easeOut,
            ),

            const SizedBox(height: AppDimensions.paddingS),

            // Tagline
            Text(
              'Ace every interview with AI',
              style: AppTextStyles.bodyMedium,
            )
            .animate()
            .fadeIn(delay: 600.ms, duration: 600.ms),

            const SizedBox(height: 80),

            // Loading indicator
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            )
            .animate()
            .fadeIn(delay: 800.ms),
          ],
        ),
      ),
    );
  }
}