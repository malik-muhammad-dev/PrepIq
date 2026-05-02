import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_dimenstions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isOutlined;
  final Color? color;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isOutlined = false,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppDimensions.buttonHeight,
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.transparent
              : color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
          border: isOutlined
              ? Border.all(
                  color: color ?? AppColors.primary,
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isOutlined
                          ? AppColors.primary
                          : Colors.white,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: isOutlined
                        ? AppColors.primary
                        : Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}