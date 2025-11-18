import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../viewmodels/preference_viewmodel.dart';
import '../widgets/ambiance_option_widget.dart';
import 'dietary_selection_view.dart';

/// View for ambiance selection
/// Follows MVVM pattern
class AmbianceSelectionView extends StatelessWidget {
  const AmbianceSelectionView({super.key});

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
                AppStrings.ambianceTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: AppConstants.spacingM),

              // Subtitle
              Text(
                AppStrings.ambianceSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppConstants.spacingL),

              // Ambiance list
              Expanded(
                child: Consumer<PreferenceViewModel>(
                  builder: (context, viewModel, child) {
                    return ListView.builder(
                      itemCount: _ambiances.length,
                      itemBuilder: (context, index) {
                        final ambiance = _ambiances[index];
                        final isSelected = viewModel.isAmbianceSelected(
                          ambiance['name'] as String,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacingL,
                          ),
                          child: AmbianceOptionWidget(
                            name: ambiance['name'] as String,
                            icon: ambiance['icon'] as String,
                            color: ambiance['color'] as Color,
                            isSelected: isSelected,
                            onTap: () {
                              viewModel.setAmbiance(ambiance['name'] as String);
                            },
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
                          viewModel.canProceedFromAmbiance()
                              ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            const DietarySelectionView(),
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
                              viewModel.canProceedFromAmbiance()
                                  ? AppColors.textOnPrimary
                                  : AppColors.textDisabled,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppConstants.spacingXxl),
            ],
          ),
        ),
      ),
    );
  }

  static final List<Map<String, dynamic>> _ambiances = [
    {'name': AppStrings.chill, 'icon': '🛋️', 'color': AppColors.secondary},
    {'name': AppStrings.romantic, 'icon': '🍷', 'color': AppColors.primary},
    {'name': AppStrings.fineDining, 'icon': '🍽️', 'color': AppColors.primary},
    {'name': AppStrings.trendy, 'icon': '🍸', 'color': AppColors.primary},
    {'name': AppStrings.business, 'icon': '💼', 'color': AppColors.primary},
  ];
}
