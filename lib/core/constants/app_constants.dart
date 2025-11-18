import 'package:flutter/material.dart';

/// App-wide constant values
class AppConstants {
  // Prevent instantiation
  AppConstants._();

  // App Info
  static const String appName = 'Restaurant Finder';
  static const String appVersion = '1.0.0';

  // API Configuration (for future use)
  static const String baseUrl = 'https://api.restaurantfinder.com';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 50;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusXxl = 24.0;
  static const double radiusCircle = 100.0;

  // Icon Sizes
  static const double iconXs = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXl = 48.0;

  // Font Sizes
  static const double fontXs = 12.0;
  static const double fontS = 14.0;
  static const double fontM = 16.0;
  static const double fontL = 18.0;
  static const double fontXl = 20.0;
  static const double fontXxl = 24.0;
  static const double fontHeadingS = 28.0;
  static const double fontHeadingM = 32.0;
  static const double fontHeadingL = 36.0;

  // Opacity
  static const double opacityDisabled = 0.4;
  static const double opacityHover = 0.8;
  static const double opacityPressed = 0.6;

  // Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Image Sizes
  static const double restaurantImageHeight = 200.0;
  static const double menuItemImageWidth = 120.0;
  static const double menuItemImageHeight = 180.0;

  // Rating
  static const double maxRating = 5.0;
  static const double minRating = 1.0;
}