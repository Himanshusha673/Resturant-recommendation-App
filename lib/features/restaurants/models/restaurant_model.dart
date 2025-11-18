/// Model representing a restaurant
/// Follows MVVM pattern - pure data model
class RestaurantModel {
  final String id;
  final String name;
  final String cuisine;
  final double rating;
  final int reviewCount;
  final double distance;
  final String imageUrl;
  final List<String> tags;
  final String recommendationReason;
  final String? address;
  final String? phoneNumber;
  final bool isOpen;
  final Map<String, String>? openingHours;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.distance,
    required this.imageUrl,
    required this.tags,
    required this.recommendationReason,
    this.address,
    this.phoneNumber,
    this.isOpen = true,
    this.openingHours,
  });

  /// Create from JSON
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      cuisine: json['cuisine'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      distance: (json['distance'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      tags: List<String>.from(json['tags'] as List),
      recommendationReason: json['recommendationReason'] as String,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isOpen: json['isOpen'] as bool? ?? true,
      openingHours: json['openingHours'] != null
          ? Map<String, String>.from(json['openingHours'] as Map)
          : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cuisine': cuisine,
      'rating': rating,
      'reviewCount': reviewCount,
      'distance': distance,
      'imageUrl': imageUrl,
      'tags': tags,
      'recommendationReason': recommendationReason,
      'address': address,
      'phoneNumber': phoneNumber,
      'isOpen': isOpen,
      'openingHours': openingHours,
    };
  }

  /// Create a copy with modified fields
  RestaurantModel copyWith({
    String? id,
    String? name,
    String? cuisine,
    double? rating,
    int? reviewCount,
    double? distance,
    String? imageUrl,
    List<String>? tags,
    String? recommendationReason,
    String? address,
    String? phoneNumber,
    bool? isOpen,
    Map<String, String>? openingHours,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cuisine: cuisine ?? this.cuisine,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      distance: distance ?? this.distance,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      recommendationReason: recommendationReason ?? this.recommendationReason,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isOpen: isOpen ?? this.isOpen,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, cuisine: $cuisine, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RestaurantModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}