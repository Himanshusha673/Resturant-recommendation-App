import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_recommendation/core/constants/app_images.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../viewmodels/preference_viewmodel.dart';
import '../widgets/cuisine_card_widget.dart';
import 'ambiance_selection_view.dart';

/// View for cuisine selection
/// Follows MVVM pattern - handles UI and user interactions
class CuisineSelectionView extends StatelessWidget {
  const CuisineSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingL,
            vertical: AppConstants.spacingXxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                AppStrings.cuisineTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: AppConstants.spacingM),

              // Subtitle
              Text(
                AppStrings.cuisineSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppConstants.spacingL),

              // Cuisine list
              Expanded(
                child: Consumer<PreferenceViewModel>(
                  builder: (context, viewModel, child) {
                    return ListView.builder(
                      itemCount: _cuisines.length,
                      itemBuilder: (context, index) {
                        final cuisine = _cuisines[index];
                        final isSelected = viewModel.isCuisineSelected(
                          cuisine['name'] as String,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacingL,
                          ),
                          child: CuisineCard(
                            name: cuisine['name'] as String,
                            emoji: cuisine['emoji'] as String,
                            gradientColors: cuisine['gradient'] as List<Color>,
                            isSelected: isSelected,
                            onTap: () {
                              viewModel.toggleCuisine(
                                cuisine['name'] as String,
                              );
                            },
                            index: index,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: AppConstants.spacingL),

              // Continue button
              Consumer<PreferenceViewModel>(
                builder: (context, viewModel, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed:
                          viewModel.canProceedFromCuisine()
                              ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            const AmbianceSelectionView(),
                                  ),
                                );
                              }
                              : null,
                      child: Text(
                        AppStrings.continueText,
                        style: TextStyle(
                          fontSize: AppConstants.fontL,
                          fontWeight: FontWeight.w600,
                          color:
                              viewModel.canProceedFromCuisine()
                                  ? AppColors.textOnPrimary
                                  : AppColors.textDisabled,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Cuisine data - in production, this would come from the repository
  static final List<Map<String, dynamic>> _cuisines = [
    {
      'name': AppStrings.american,
      'emoji': AppImages.burger,
      'gradient': AppColors.primaryGradient,
    },
    {
      'name': AppStrings.italian,
      'emoji': AppImages.pizza,
      'gradient': AppColors.primaryGradient,
    },
    // {
    //   'name': AppStrings.mexican,
    //   'emoji':AppImages.indianFood,
    //   'gradient': AppColors.primaryGradient,
    // },
    {
      'name': AppStrings.indian,
      'emoji': AppImages.indianFood,
      'gradient': AppColors.primaryGradient,
    },
    {
      'name': AppStrings.japanese,
      'emoji': AppImages.japanese,
      'gradient': AppColors.primaryGradient,
    },
  ];
}
