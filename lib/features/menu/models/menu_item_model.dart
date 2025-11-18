/// Model representing a menu item
/// Follows MVVM pattern - pure data model
class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> tags;
  final String category;
  final bool isAvailable;
  final int? calories;
  final List<String>? allergens;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.tags,
    this.category = 'Mains',
    this.isAvailable = true,
    this.calories,
    this.allergens,
  });

  /// Create from JSON
  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      tags: List<String>.from(json['tags'] as List),
      category: json['category'] as String? ?? 'Mains',
      isAvailable: json['isAvailable'] as bool? ?? true,
      calories: json['calories'] as int?,
      allergens: json['allergens'] != null
          ? List<String>.from(json['allergens'] as List)
          : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'tags': tags,
      'category': category,
      'isAvailable': isAvailable,
      'calories': calories,
      'allergens': allergens,
    };
  }

  /// Create a copy with modified fields
  MenuItemModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    List<String>? tags,
    String? category,
    bool? isAvailable,
    int? calories,
    List<String>? allergens,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      calories: calories ?? this.calories,
      allergens: allergens ?? this.allergens,
    );
  }

  /// Check if item matches dietary restrictions
  bool matchesDietaryRestrictions(List<String> restrictions) {
    if (restrictions.isEmpty) return true;
    return restrictions.any((restriction) => tags.contains(restriction));
  }

  /// Get formatted price
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  @override
  String toString() {
    return 'MenuItemModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuItemModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}