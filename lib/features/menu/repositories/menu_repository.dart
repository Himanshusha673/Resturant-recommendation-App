import '../models/menu_item_model.dart';

/// Repository for menu data
/// Follows MVVM pattern - handles data operations
class MenuRepository {
  /// Fetch menu items for a restaurant
  Future<List<MenuItemModel>> fetchMenuItems(String restaurantId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data - in production, this would be an API call
    return _getMockMenuItems(restaurantId);
  }

  /// Get menu item by ID
  Future<MenuItemModel?> getMenuItemById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    try {
      final allItems = _getAllMockMenuItems();
      return allItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Filter menu items by dietary restrictions
  Future<List<MenuItemModel>> filterByDietary(
    String restaurantId,
    List<String> dietary,
  ) async {
    final items = await fetchMenuItems(restaurantId);
    
    if (dietary.isEmpty) return items;
    
    return items.where((item) {
      return dietary.any((diet) => item.tags.contains(diet));
    }).toList();
  }

  /// Filter menu items by category
  Future<List<MenuItemModel>> filterByCategory(
    String restaurantId,
    String category,
  ) async {
    final items = await fetchMenuItems(restaurantId);
    return items.where((item) => item.category == category).toList();
  }

  /// Get mock menu items for a specific restaurant
  List<MenuItemModel> _getMockMenuItems(String restaurantId) {
    // In production, this would filter by actual restaurant ID
    // For now, returning generic Mexican food items
    return [
      MenuItemModel(
        id: '1',
        name: 'Veggie Fajita Bowl',
        description: 'Rice, black beans, fajita vegetables, guacamole, and salsa',
        price: 10.49,
        imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
        tags: ['Vegan', 'Gluten Free'],
        category: 'Mains',
        isAvailable: true,
        calories: 450,
        allergens: [],
      ),
      MenuItemModel(
        id: '2',
        name: 'Tofu Tacos',
        description: 'Tacos with marinated tofu and various toppings',
        price: 9.99,
        imageUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=400',
        tags: ['Vegan', 'Vegetarian'],
        category: 'Mains',
        isAvailable: true,
        calories: 380,
        allergens: ['Soy'],
      ),
      MenuItemModel(
        id: '3',
        name: 'Chicken Burrito',
        description: 'Grilled chicken, rice, beans, cheese, and salsa wrapped in a flour tortilla',
        price: 12.99,
        imageUrl: 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=400',
        tags: ['Halal'],
        category: 'Mains',
        isAvailable: true,
        calories: 620,
        allergens: ['Dairy', 'Gluten'],
      ),
      MenuItemModel(
        id: '4',
        name: 'Beef Quesadilla',
        description: 'Grilled tortilla filled with seasoned beef and melted cheese',
        price: 11.49,
        imageUrl: 'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=400',
        tags: ['Halal'],
        category: 'Mains',
        isAvailable: true,
        calories: 580,
        allergens: ['Dairy', 'Gluten'],
      ),
      MenuItemModel(
        id: '5',
        name: 'Guacamole & Chips',
        description: 'Fresh guacamole served with crispy tortilla chips',
        price: 6.99,
        imageUrl: 'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=400',
        tags: ['Vegan', 'Gluten Free', 'Vegetarian'],
        category: 'Appetizers',
        isAvailable: true,
        calories: 280,
        allergens: [],
      ),
      MenuItemModel(
        id: '6',
        name: 'Churros',
        description: 'Crispy fried dough pastries dusted with cinnamon sugar',
        price: 5.99,
        imageUrl: 'https://images.unsplash.com/photo-1600626335860-6d4c20e62f56?w=400',
        tags: ['Vegetarian'],
        category: 'Desserts',
        isAvailable: true,
        calories: 320,
        allergens: ['Gluten', 'Dairy'],
      ),
    ];
  }

  /// Get all mock menu items
  List<MenuItemModel> _getAllMockMenuItems() {
    return _getMockMenuItems('all');
  }
}