import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_recommendation/utils/constants/app_images.dart';
import '../providers/preference_provider.dart';
import '../widgets/cuisine_card.dart';
import 'ambiance_selection_screen.dart';

class CuisineSelectionScreen extends StatelessWidget {
  const CuisineSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    final cuisines = [
      {
        'name': 'American',
        'emoji': AppImages.burger,
        'gradient': [Color(0xFFD4AF37), Colors.transparent],
      },
      {
        'name': 'Italian',
        'emoji': AppImages.pizza,
        'gradient': [Color(0xFFD4AF37), Colors.transparent],
      },

      {
        'name': 'Indian',
        'emoji': AppImages.indianFood,
        'gradient': [Color(0xFFD4AF37), Colors.transparent],
      },
      {
        'name': 'Japanese',
        'emoji': AppImages.japanese,
        'gradient': [Color(0xFFD4AF37), Colors.transparent],
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What are you in the mood for?',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover restaurants that serve your favourite cuisine',
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: ListView.builder(
                  itemCount: cuisines.length,
                  itemBuilder: (context, index) {
                    final cuisine = cuisines[index];
                    final isSelected = provider.selectedCuisines.contains(
                      cuisine['name'],
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CuisineCard(
                        name: cuisine['name'] as String,
                        emoji: cuisine['emoji'] as String,
                        gradientColors: cuisine['gradient'] as List<Color>,
                        isSelected: isSelected,
                        onTap: () {
                          provider.toggleCuisine(cuisine['name'] as String);
                        },
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed:
                      provider.selectedCuisines.isEmpty
                          ? null
                          : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        const AmbianceSelectionScreen(),
                              ),
                            );
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    disabledBackgroundColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:
                          provider.selectedCuisines.isEmpty
                              ? Colors.grey.shade600
                              : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
