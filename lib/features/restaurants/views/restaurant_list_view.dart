import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_recommendation/features/menu/views/menu_view.dart';
import 'package:resturant_recommendation/features/restaurants/widgets/filter_chip_button.dart';
import 'package:resturant_recommendation/features/restaurants/widgets/restaurant_card_widget.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../viewmodels/restaurant_viewmodel.dart';
import '../../preferences/viewmodels/preference_viewmodel.dart';

/// View for restaurant list
class RestaurantListView extends StatefulWidget {
  const RestaurantListView({super.key});

  @override
  State<RestaurantListView> createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRestaurants();
    });
  }

  void _loadRestaurants() {
    final preferenceVM = context.read<PreferenceViewModel>();
    final restaurantVM = context.read<RestaurantViewModel>();

    restaurantVM.loadRestaurants(
      cuisines: preferenceVM.selectedCuisines,
      dietary: preferenceVM.selectedDietary,
      ambiance: preferenceVM.selectedAmbiance,
    );
  }

  @override
  Widget build(BuildContext context) {
    final preferenceVM = context.watch<PreferenceViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColors.textPrimary,
              size: AppConstants.iconS,
            ),
            const SizedBox(width: AppConstants.spacingS),
            const Expanded(
              child: Text(
                '1755 Elton Rd, Silver Spring',
                style: TextStyle(fontSize: AppConstants.fontS),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement location change
              },
              child: const Text(AppStrings.change),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search and filters
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacingM),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,

                  onChanged: (query) {
                    context.read<RestaurantViewModel>().searchRestaurants(
                      query,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.searchHint,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),

                    prefixIcon: Icon(Icons.search),

                    suffixIcon:
                        _searchController.text.isNotEmpty
                            ? GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                                context
                                    .read<RestaurantViewModel>()
                                    .searchRestaurants('');
                              },
                              child: const Icon(
                                Icons.close,
                                color: AppColors.textTertiary,
                              ),
                            )
                            : null,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      borderSide: const BorderSide(
                        color: AppColors.border,
                        width: 0.8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      borderSide: const BorderSide(
                        color: AppColors.border,
                        width: 0.8,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                ),
                const SizedBox(height: AppConstants.spacingM),

                // Filter chips
                Row(
                  children: [
                    FilterChipButton(
                      label: AppStrings.cuisine,
                      icon: Icons.restaurant,
                      isSelected: preferenceVM.hasCuisineSelection,
                      onTap: () {},
                    ),
                    const SizedBox(width: AppConstants.spacingS),
                    FilterChipButton(
                      label: AppStrings.dietary,
                      icon: Icons.eco,
                      isSelected: preferenceVM.hasDietarySelection,
                      onTap: () {
                        // TODO: Show dietary filter dialog
                      },
                    ),
                    const SizedBox(width: AppConstants.spacingS),
                    FilterChipButton(
                      label: AppStrings.ambience,
                      icon: Icons.music_note,
                      isSelected: preferenceVM.hasAmbianceSelection,
                      onTap: () {
                        // TODO: Show ambiance filter dialog
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacingM,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.topRated,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.spacingM),

          // Restaurant list
          Expanded(
            child: Consumer<RestaurantViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                if (viewModel.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: AppConstants.iconXl * 2,
                          color: AppColors.error,
                        ),
                        const SizedBox(height: AppConstants.spacingM),
                        Text(
                          viewModel.error ?? AppStrings.errorGeneric,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                }

                if (!viewModel.hasRestaurants) {
                  return Center(
                    child: Text(
                      AppStrings.emptyRestaurants,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingM,
                  ),
                  itemCount: viewModel.restaurantCount,
                  itemBuilder: (context, index) {
                    final restaurant = viewModel.restaurants[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppConstants.spacingL,
                      ),
                      child: RestaurantCardWidget(
                        restaurant: restaurant,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      MenuScreen(restaurant: restaurant),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
