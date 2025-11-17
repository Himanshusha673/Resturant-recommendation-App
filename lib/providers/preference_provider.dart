import 'package:flutter/foundation.dart';

class PreferenceProvider extends ChangeNotifier {
  final List<String> _selectedCuisines = [];
  final List<String> _selectedDietary = [];
  String? _selectedAmbiance;

  List<String> get selectedCuisines => _selectedCuisines;
  List<String> get selectedDietary => _selectedDietary;
  String? get selectedAmbiance => _selectedAmbiance;

  void toggleCuisine(String cuisine) {
    if (_selectedCuisines.contains(cuisine)) {
      _selectedCuisines.remove(cuisine);
    } else {
      _selectedCuisines.add(cuisine);
    }
    notifyListeners();
  }

  void toggleDietary(String dietary) {
    if (_selectedDietary.contains(dietary)) {
      _selectedDietary.remove(dietary);
    } else {
      _selectedDietary.add(dietary);
    }
    notifyListeners();
  }

  void setAmbiance(String ambiance) {
    _selectedAmbiance = ambiance;
    notifyListeners();
  }

  void clearCuisines() {
    _selectedCuisines.clear();
    notifyListeners();
  }

  void clearDietary() {
    _selectedDietary.clear();
    notifyListeners();
  }

  void clearAmbiance() {
    _selectedAmbiance = null;
    notifyListeners();
  }

  void resetAll() {
    _selectedCuisines.clear();
    _selectedDietary.clear();
    _selectedAmbiance = null;
    notifyListeners();
  }
}