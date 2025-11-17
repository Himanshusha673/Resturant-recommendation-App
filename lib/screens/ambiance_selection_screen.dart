import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/preference_provider.dart';
import '../widgets/ambiance_option.dart';
import 'dietary_selection_screen.dart';

class AmbianceSelectionScreen extends StatelessWidget {
  const AmbianceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);

    final ambiances = [
      {'name': 'Chill', 'icon': '🛋️', 'color': Color(0xFFFF9F66)},
      {'name': 'Romantic', 'icon': '🍷', 'color': Color(0xFFD4AF37)},
      {'name': 'Fine Dining', 'icon': '🍽️', 'color': Color(0xFFD4AF37)},
      {'name': 'Trendy', 'icon': '🍸', 'color': Color(0xFFD4AF37)},
      {'name': 'Business', 'icon': '💼', 'color': Color(0xFFD4AF37)},
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
                'Pick Your Vibe',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Discover restaurants that match your mood',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              Expanded(
                child: ListView.builder(
                  itemCount: ambiances.length,
                  itemBuilder: (context, index) {
                    final ambiance = ambiances[index];
                    final isSelected = provider.selectedAmbiance == ambiance['name'];
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: AmbianceOption(
                        name: ambiance['name'] as String,
                        icon: ambiance['icon'] as String,
                        color: ambiance['color'] as Color,
                        isSelected: isSelected,
                        onTap: () {
                          provider.setAmbiance(ambiance['name'] as String);
                        },
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
                  onPressed: provider.selectedAmbiance == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DietarySelectionScreen(),
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
                      color: provider.selectedAmbiance == null
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}