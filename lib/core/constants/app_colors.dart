import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background     = Color(0xFF0F0F1A);
  static const Color cardBackground = Color(0xFF1A1225);
  static const Color cardLight      = Color(0xFF241830);

  // Brand
  static const Color primary        = Color(0xFF7C6FFF);
  static const Color primaryLight   = Color(0xFF9D93FF);

  // Gradient
  static const Color gradientStart  = Color(0xFFFF6B9D);
  static const Color gradientEnd    = Color(0xFFFF8C42);

  // Text
  static const Color textPrimary    = Color(0xFFFFFFFF);
  static const Color textSecondary  = Color(0xFF9090AA);
  static const Color textHint       = Color(0xFF555570);

  // Status
  static const Color success        = Color(0xFF00D68F);
  static const Color warning        = Color(0xFFFFAA00);
  static const Color error          = Color(0xFFFF4D6A);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}