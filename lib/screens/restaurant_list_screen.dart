import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/preference_provider.dart';
import '../models/restaurant.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/filter_chip_widget.dart';
import 'menu_recommendation_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Guacado Mexican Grill',
      cuisine: 'Mexican',
      rating: 4.5,
      reviewCount: 1300,
      distance: 6.9,
      imageUrl: 'https://images.unsplash.com/photo-1599974982760-6c1e5b92c0e3?w=800',
      tags: ['Mexican', 'Halal'],
      recommendationReason: 'Recommended for you because you like Mexican + Halal options',
    ),
    Restaurant(
      name: 'Marar Indian Kitchen',
      cuisine: 'Indian',
      rating: 4.2,
      reviewCount: 890,
      distance: 4.5,
      imageUrl: 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=800',
      tags: ['Indian', 'Vegetarian'],
      recommendationReason: 'Great vegetarian options',
    ),
    Restaurant(
      name: 'Luigi\'s Italian Bistro',
      cuisine: 'Italian',
      rating: 4.7,
      reviewCount: 2100,
      distance: 3.2,
      imageUrl: 'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?w=800',
      tags: ['Italian', 'Fine Dining'],
      recommendationReason: 'Perfect for romantic ambiance',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                '1755 Elton Rd, Silver Spring',
                style: TextStyle(fontSize: 14, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement location change
              },
              child: const Text(
                'Change',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search restaurants by name...',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    FilterChipWidget(
                      label: 'Cuisine',
                      icon: Icons.restaurant,
                      isSelected: provider.selectedCuisines.isNotEmpty,
                      onTap: () {
                        // TODO: Show cuisine filter dialog
                      },
                    ),
                    const SizedBox(width: 12),
                    FilterChipWidget(
                      label: 'Dietary',
                      icon: Icons.eco,
                      isSelected: provider.selectedDietary.isNotEmpty,
                      onTap: () {
                        // TODO: Show dietary filter dialog
                      },
                    ),
                    const SizedBox(width: 12),
                    FilterChipWidget(
                      label: 'Ambience',
                      icon: Icons.music_note,
                      isSelected: provider.selectedAmbiance != null,
                      onTap: () {
                        // TODO: Show ambiance filter dialog
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Rated',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: RestaurantCard(
                    restaurant: _restaurants[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuRecommendationScreen(
                            restaurant: _restaurants[index],
                          ),
                        ),
                      );
                    },
                  ),
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