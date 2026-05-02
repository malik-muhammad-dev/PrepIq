import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../controller/home_controller.dart';

class HomeHeader extends StatelessWidget {
  final HomeController controller;

  const HomeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back 👋',
              style: AppTextStyles.bodyMedium,
            ),
            Text(
              'PrepIQ',
              style: AppTextStyles.displayMedium,
            ),
          ],
        )
        .animate()
        .fadeIn(duration: 500.ms)
        .slideY(begin: -0.2, end: 0),

        Container(
          width: AppDimensions.avatarM,
          height: AppDimensions.avatarM,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
          ),
          child: const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 24,
          ),
        )
        .animate()
        .fadeIn(delay: 200.ms),
      ],
    );
  }
}