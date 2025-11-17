class Restaurant {
  final String name;
  final String cuisine;
  final double rating;
  final int reviewCount;
  final double distance;
  final String imageUrl;
  final List<String> tags;
  final String recommendationReason;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.distance,
    required this.imageUrl,
    required this.tags,
    required this.recommendationReason,
  });
}