import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';

/// Reusable widget for ambiance option
class AmbianceOptionWidget extends StatelessWidget {
  final String name;
  final String icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const AmbianceOptionWidget({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.shortAnimation,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? color : AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(AppConstants.radiusXxl),
          border: Border.all(
            color: isSelected ? color : AppColors.border,
            width: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXl,
          ),
          child: Row(
            children: [
              // Icon
              Text(icon, style: TextStyle(fontSize: AppConstants.iconXl)),
              const SizedBox(width: AppConstants.spacingL),

              // Name
              Text(
                name,
                style: TextStyle(
                  fontSize: AppConstants.fontHeadingS,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.textOnPrimary : color,
                ),
              ),
              const Spacer(),

              // Selection indicator
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: AppColors.textOnPrimary,
                  size: AppConstants.iconL,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
