import 'package:flutter/material.dart';

/// Application color palette
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFD4AF37); // Gold
  static const Color primaryLight = Color(0xFFE5C76B);
  static const Color primaryDark = Color(0xFFB8941F);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF9F66); // Orange
  static const Color secondaryLight = Color(0xFFFFB88C);
  static const Color secondaryDark = Color(0xFFE67E3C);

  // Background Colors
  static const Color background = Color(0xFF000000); // Pure Black
  static const Color backgroundLight = Color.fromARGB(255, 16, 16, 16);
  static const Color backgroundCard = Color(0xFF1A1A1A);
  static const Color backgroundInput = Color(0xFF2C2C2C);

  // Surface Colors
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFF2C2C2C);
  static const Color surfaceDark = Color(0xFF0D0D0D);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White
  static const Color textSecondary = Color(0xFFB0B0B0); // Light Gray
  static const Color textTertiary = Color(0xFF808080); // Medium Gray
  static const Color textDisabled = Color(0xFF505050); // Dark Gray
  static const Color textOnPrimary = Color(
    0xFF000000,
  ); // Black (for gold buttons)
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors
  static const Color border = Color(0xFF2C2C2C);
  static const Color borderLight = Color(0xFF3D3D3D);
  static const Color borderDark = Color(0xFF1A1A1A);

  // Interactive States
  static const Color hover = Color(0xFF2C2C2C);
  static const Color pressed = Color(0xFF3D3D3D);
  static const Color selected = primary;
  static const Color disabled = Color(0xFF505050);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFFD4AF37),
    Colors.transparent,
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFFFF9F66),
    Color(0xFFE67E3C),
  ];

  static const List<Color> darkGradient = [
    Color(0xFF2C2C2C),
    Color(0xFF1A1A1A),
  ];

  static const List<Color> blackGradient = [
    Color(0xFF1A1A1A),
    Color(0xFF000000),
  ];

  // Overlay Colors
  static const Color overlayLight = Color(0x1AFFFFFF);
  static const Color overlayMedium = Color(0x33FFFFFF);
  static const Color overlayDark = Color(0x4D000000);
  static const Color overlayHeavy = Color(0xCC000000);

  // Special Colors
  static const Color rating = Color(0xFFD4AF37); // Gold for stars
  static const Color vegan = Color(0xFF4CAF50);
  static const Color vegetarian = Color(0xFF8BC34A);
  static const Color halal = Color(0xFFD4AF37);
  static const Color glutenFree = Color(0xFF9C27B0);

  // Shadow Colors
  static Color shadowLight = Colors.black.withOpacity(0.1);
  static Color shadowMedium = Colors.black.withOpacity(0.2);
  static Color shadowHeavy = Colors.black.withOpacity(0.4);
}
