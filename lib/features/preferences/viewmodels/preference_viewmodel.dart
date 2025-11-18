import 'package:flutter/foundation.dart';

/// ViewModel for managing user preferences
/// Follows MVVM pattern - handles business logic and state management
class PreferenceViewModel extends ChangeNotifier {
  // Private state
  final List<String> _selectedCuisines = [];
  final List<String> _selectedDietary = [];
  String? _selectedAmbiance;

  // Getters for read-only access to state
  List<String> get selectedCuisines => List.unmodifiable(_selectedCuisines);
  List<String> get selectedDietary => List.unmodifiable(_selectedDietary);
  String? get selectedAmbiance => _selectedAmbiance;

  // Computed properties
  bool get hasCuisineSelection => _selectedCuisines.isNotEmpty;
  bool get hasAmbianceSelection => _selectedAmbiance != null;
  bool get hasDietarySelection => _selectedDietary.isNotEmpty;
  bool get hasAnyPreferences => hasCuisineSelection || hasAmbianceSelection || hasDietarySelection;

  int get cuisineCount => _selectedCuisines.length;
  int get dietaryCount => _selectedDietary.length;

  /// Toggle cuisine selection (multi-select)
  void toggleCuisine(String cuisine) {
    if (_selectedCuisines.contains(cuisine)) {
      _selectedCuisines.remove(cuisine);
    } else {
      _selectedCuisines.add(cuisine);
    }
    notifyListeners();
  }

  /// Check if a specific cuisine is selected
  bool isCuisineSelected(String cuisine) {
    return _selectedCuisines.contains(cuisine);
  }

  /// Set ambiance (single select)
  void setAmbiance(String ambiance) {
    _selectedAmbiance = ambiance;
    notifyListeners();
  }

  /// Check if a specific ambiance is selected
  bool isAmbianceSelected(String ambiance) {
    return _selectedAmbiance == ambiance;
  }

  /// Toggle dietary restriction (multi-select)
  void toggleDietary(String dietary) {
    if (_selectedDietary.contains(dietary)) {
      _selectedDietary.remove(dietary);
    } else {
      _selectedDietary.add(dietary);
    }
    notifyListeners();
  }

  /// Check if a specific dietary restriction is selected
  bool isDietarySelected(String dietary) {
    return _selectedDietary.contains(dietary);
  }

  /// Clear all cuisine selections
  void clearCuisines() {
    _selectedCuisines.clear();
    notifyListeners();
  }

  /// Clear ambiance selection
  void clearAmbiance() {
    _selectedAmbiance = null;
    notifyListeners();
  }

  /// Clear all dietary selections
  void clearDietary() {
    _selectedDietary.clear();
    notifyListeners();
  }

  /// Reset all preferences
  void resetAllPreferences() {
    _selectedCuisines.clear();
    _selectedDietary.clear();
    _selectedAmbiance = null;
    notifyListeners();
  }

  /// Get preference summary for display
  String getPreferenceSummary() {
    final List<String> parts = [];
    
    if (hasCuisineSelection) {
      parts.add('${_selectedCuisines.length} cuisine(s)');
    }
    
    if (hasAmbianceSelection) {
      parts.add(_selectedAmbiance!);
    }
    
    if (hasDietarySelection) {
      parts.add('${_selectedDietary.length} dietary preference(s)');
    }

    return parts.isEmpty ? 'No preferences set' : parts.join(' • ');
  }

  /// Validate if user can proceed to next step
  bool canProceedFromCuisine() => hasCuisineSelection;
  bool canProceedFromAmbiance() => hasAmbianceSelection;
  bool canProceedFromDietary() => true; // Dietary is optional
}