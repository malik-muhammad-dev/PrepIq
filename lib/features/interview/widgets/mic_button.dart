import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';

class MicButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onTap;

  const MicButton({
    super.key,
    required this.isListening,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mic button
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isListening
                  ? const LinearGradient(
                      colors: [AppColors.error, Color(0xFFFF8C42)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: isListening
                      ? AppColors.error.withOpacity(0.4)
                      : AppColors.gradientStart.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: isListening ? 10 : 5,
                ),
              ],
            ),
            child: Icon(
              isListening ? Icons.stop_rounded : Icons.mic_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        )
        .animate(target: isListening ? 1 : 0)
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.1, 1.1),
          duration: 600.ms,
          curve: Curves.easeInOut,
        ),

        const SizedBox(height: AppDimensions.paddingL),

        // Label
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            isListening ? AppStrings.tapToStop : AppStrings.tapToSpeak,
            key: ValueKey(isListening),
            style: AppTextStyles.bodyMedium.copyWith(
              color: isListening ? AppColors.error : AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}