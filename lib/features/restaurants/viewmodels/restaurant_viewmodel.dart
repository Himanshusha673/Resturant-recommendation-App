import 'package:flutter/foundation.dart';
import '../models/restaurant_model.dart';
import '../repositories/restaurant_repository.dart';

/// ViewModel for managing restaurant data and state
/// Follows MVVM pattern
class RestaurantViewModel extends ChangeNotifier {
  final RestaurantRepository _repository;

  // State
  List<RestaurantModel> _restaurants = [];
  List<RestaurantModel> _filteredRestaurants = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  // Constructor
  RestaurantViewModel({RestaurantRepository? repository})
      : _repository = repository ?? RestaurantRepository();

  // Getters
  List<RestaurantModel> get restaurants => List.unmodifiable(_filteredRestaurants);
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;
  bool get hasRestaurants => _filteredRestaurants.isNotEmpty;
  bool get hasError => _error != null;
  int get restaurantCount => _filteredRestaurants.length;

  /// Load restaurants based on preferences
  Future<void> loadRestaurants({
    List<String>? cuisines,
    List<String>? dietary,
    String? ambiance,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      _restaurants = await _repository.fetchRestaurants(
        cuisines: cuisines,
        dietary: dietary,
        ambiance: ambiance,
      );
      _filteredRestaurants = List.from(_restaurants);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  /// Search restaurants by name
  void searchRestaurants(String query) {
    _searchQuery = query.toLowerCase().trim();
    
    if (_searchQuery.isEmpty) {
      _filteredRestaurants = List.from(_restaurants);
    } else {
      _filteredRestaurants = _restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(_searchQuery))
          .toList();
    }
    
    notifyListeners();
  }

  /// Filter restaurants by cuisine
  void filterByCuisine(List<String> cuisines) {
    if (cuisines.isEmpty) {
      _filteredRestaurants = List.from(_restaurants);
    } else {
      _filteredRestaurants = _restaurants
          .where((restaurant) => cuisines.contains(restaurant.cuisine))
          .toList();
    }
    notifyListeners();
  }

  /// Filter restaurants by dietary restrictions
  void filterByDietary(List<String> dietary) {
    if (dietary.isEmpty) {
      _filteredRestaurants = List.from(_restaurants);
    } else {
      _filteredRestaurants = _restaurants
          .where((restaurant) =>
              dietary.any((diet) => restaurant.tags.contains(diet)))
          .toList();
    }
    notifyListeners();
  }

  /// Sort restaurants by distance
  void sortByDistance() {
    _filteredRestaurants.sort((a, b) => a.distance.compareTo(b.distance));
    notifyListeners();
  }

  /// Sort restaurants by rating
  void sortByRating() {
    _filteredRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
    notifyListeners();
  }

  /// Get restaurant by ID
  RestaurantModel? getRestaurantById(String id) {
    try {
      return _restaurants.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Refresh restaurants
  Future<void> refresh({
    List<String>? cuisines,
    List<String>? dietary,
    String? ambiance,
  }) async {
    await loadRestaurants(
      cuisines: cuisines,
      dietary: dietary,
      ambiance: ambiance,
    );
  }

  /// Clear search
  void clearSearch() {
    _searchQuery = '';
    _filteredRestaurants = List.from(_restaurants);
    notifyListeners();
  }

  /// Clear all filters
  void clearFilters() {
    _filteredRestaurants = List.from(_restaurants);
    notifyListeners();
  }

  // Private helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }
}