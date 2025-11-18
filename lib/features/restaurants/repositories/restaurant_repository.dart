import '../models/restaurant_model.dart';

/// Repository for restaurant data
/// Follows MVVM pattern - handles data operations
/// In production, this would connect to an API
class RestaurantRepository {
  /// Fetch restaurants based on preferences
  /// Returns mock data for now - replace with API calls in production
  Future<List<RestaurantModel>> fetchRestaurants({
    List<String>? cuisines,
    List<String>? dietary,
    String? ambiance,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data - in production, this would be an API call
    final allRestaurants = _getMockRestaurants();

    // Filter by preferences
    var filtered = allRestaurants;

    if (cuisines != null && cuisines.isNotEmpty) {
      filtered = filtered
          .where((r) => cuisines.contains(r.cuisine))
          .toList();
    }

    if (dietary != null && dietary.isNotEmpty) {
      filtered = filtered
          .where((r) => dietary.any((d) => r.tags.contains(d)))
          .toList();
    }

    return filtered;
  }

  /// Get restaurant by ID
  Future<RestaurantModel?> getRestaurantById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    try {
      return _getMockRestaurants().firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Search restaurants by name
  Future<List<RestaurantModel>> searchRestaurants(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final lowercaseQuery = query.toLowerCase();
    return _getMockRestaurants()
        .where((r) => r.name.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  /// Get mock restaurant data
  List<RestaurantModel> _getMockRestaurants() {
    return [
      RestaurantModel(
        id: '1',
        name: 'Guacado Mexican Grill',
        cuisine: 'Mexican',
        rating: 4.5,
        reviewCount: 1300,
        distance: 6.9,
        imageUrl: 'https://images.unsplash.com/photo-1599974982760-6c1e5b92c0e3?w=800',
        tags: ['Mexican', 'Halal'],
        recommendationReason: 'Recommended for you because you like Mexican + Halal options',
        address: '123 Main St, City',
        phoneNumber: '+1 234-567-8900',
        isOpen: true,
        openingHours: {
          'Monday': '11:00 AM - 10:00 PM',
          'Tuesday': '11:00 AM - 10:00 PM',
          'Wednesday': '11:00 AM - 10:00 PM',
          'Thursday': '11:00 AM - 10:00 PM',
          'Friday': '11:00 AM - 11:00 PM',
          'Saturday': '11:00 AM - 11:00 PM',
          'Sunday': '11:00 AM - 9:00 PM',
        },
      ),
      RestaurantModel(
        id: '2',
        name: 'Marar Indian Kitchen',
        cuisine: 'Indian',
        rating: 4.2,
        reviewCount: 890,
        distance: 4.5,
        imageUrl: 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=800',
        tags: ['Indian', 'Vegetarian', 'Vegan'],
        recommendationReason: 'Great vegetarian options',
        address: '456 Oak Ave, City',
        phoneNumber: '+1 234-567-8901',
        isOpen: true,
      ),
      RestaurantModel(
        id: '3',
        name: 'Luigi\'s Italian Bistro',
        cuisine: 'Italian',
        rating: 4.7,
        reviewCount: 2100,
        distance: 3.2,
        imageUrl: 'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?w=800',
        tags: ['Italian', 'Fine Dining'],
        recommendationReason: 'Perfect for romantic ambiance',
        address: '789 Pine St, City',
        phoneNumber: '+1 234-567-8902',
        isOpen: true,
      ),
      RestaurantModel(
        id: '4',
        name: 'Tokyo Sushi House',
        cuisine: 'Japanese',
        rating: 4.6,
        reviewCount: 1560,
        distance: 2.8,
        imageUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=800',
        tags: ['Japanese', 'Pescatarian'],
        recommendationReason: 'Fresh sushi and authentic Japanese cuisine',
        address: '321 Elm St, City',
        phoneNumber: '+1 234-567-8903',
        isOpen: true,
      ),
      RestaurantModel(
        id: '5',
        name: 'The American Diner',
        cuisine: 'American',
        rating: 4.3,
        reviewCount: 980,
        distance: 5.1,
        imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800',
        tags: ['American', 'Casual'],
        recommendationReason: 'Classic American comfort food',
        address: '654 Maple Dr, City',
        phoneNumber: '+1 234-567-8904',
        isOpen: true,
      ),
    ];
  }
}