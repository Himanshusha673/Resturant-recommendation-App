import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/preference_provider.dart';
import '../widgets/dietary_option.dart';
import 'restaurant_list_screen.dart';

class DietarySelectionScreen extends StatelessWidget {
  const DietarySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    final dietaryOptions = [
      {'name': 'Vegetarian', 'icon': '🌱', 'color': Color(0xFFD4AF37)},
      {'name': 'Vegan', 'icon': '🌿', 'color': Color(0xFF2C2C2C)},
      {'name': 'Halal', 'icon': '☪️', 'color': Color(0xFF2C2C2C)},
      {'name': 'Pescatarian', 'icon': '🐟', 'color': Color(0xFF2C2C2C)},
      {'name': 'Keto', 'icon': '🧊', 'color': Color(0xFF2C2C2C)},
      {'name': 'Allergies', 'icon': '⚠️', 'color': Color(0xFF2C2C2C)},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Tailor Your Preference',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover restaurants that cater to your diet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: ListView.builder(
                  itemCount: dietaryOptions.length,
                  itemBuilder: (context, index) {
                    final option = dietaryOptions[index];
                    final isSelected = provider.selectedDietary.contains(option['name']);
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: DietaryOption(
                        name: option['name'] as String,
                        icon: option['icon'] as String,
                        color: option['color'] as Color,
                        isSelected: isSelected,
                        onTap: () {
                          provider.toggleDietary(option['name'] as String);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestaurantListScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFD4AF37)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFD4AF37),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestaurantListScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Find Restaurants',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}