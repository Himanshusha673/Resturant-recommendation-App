import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../viewmodels/preference_viewmodel.dart';
import '../widgets/dietary_option_widget.dart';
import '../../restaurants/views/restaurant_list_view.dart';

/// View for dietary selection
class DietarySelectionView extends StatelessWidget {
  const DietarySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                AppStrings.dietaryTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: AppConstants.spacingM),

              // Subtitle
              Text(
                AppStrings.dietarySubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppConstants.spacingL),

              // Dietary options list
              Expanded(
                child: Consumer<PreferenceViewModel>(
                  builder: (context, viewModel, child) {
                    return ListView.builder(
                      itemCount: _dietaryOptions.length,
                      itemBuilder: (context, index) {
                        final option = _dietaryOptions[index];
                        final isSelected = viewModel.isDietarySelected(
                          option['name'] as String,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacingL,
                          ),
                          child: DietaryOptionWidget(
                            name: option['name'] as String,
                            icon: option['icon'] as String,
                            color: option['color'] as Color,
                            isSelected: isSelected,
                            onTap: () {
                              viewModel.toggleDietary(option['name'] as String);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: AppConstants.spacingL),

              // Action buttons
              Row(
                children: [
                  // Skip button
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () => _navigateToRestaurants(context),
                        child: const Text(AppStrings.skip),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacingM),

                  // Find Restaurants button
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => _navigateToRestaurants(context),
                        child: const Text(AppStrings.findRestaurants),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.spacingXxl),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRestaurants(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RestaurantListView()),
    );
  }

  static final List<Map<String, dynamic>> _dietaryOptions = [
    {'name': AppStrings.vegetarian, 'icon': '🌱', 'color': AppColors.primary},
    {'name': AppStrings.vegan, 'icon': '🌿', 'color': AppColors.surfaceLight},
    {'name': AppStrings.halal, 'icon': '☪️', 'color': AppColors.surfaceLight},
    {
      'name': AppStrings.pescatarian,
      'icon': '🐟',
      'color': AppColors.surfaceLight,
    },
    {'name': AppStrings.keto, 'icon': '🧊', 'color': AppColors.surfaceLight},
    {
      'name': AppStrings.allergies,
      'icon': '⚠️',
      'color': AppColors.surfaceLight,
    },
  ];
}
