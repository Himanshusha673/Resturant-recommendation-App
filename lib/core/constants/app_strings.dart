/// Application string constants
class AppStrings {
  // Prevent instantiation
  AppStrings._();

  // Common
  static const String appName = 'Restaurant Finder';
  static const String continueText = 'Continue';
  static const String skip = 'Skip';
  static const String back = 'Back';
  static const String search = 'Search';
  static const String filter = 'Filter';
  static const String change = 'Change';
  static const String menu = 'Menu';
  static const String info = 'Info';
  static const String reviews = 'Reviews';

  // Cuisine Selection Screen
  static const String cuisineTitle = 'What are you in the mood for?';
  static const String cuisineSubtitle = 'Discover restaurants that serve your favourite cuisine';
  
  // Cuisines
  static const String american = 'American';
  static const String italian = 'Italian';
  static const String mexican = 'Mexican';
  static const String indian = 'Indian';
  static const String japanese = 'Japanese';
  static const String chinese = 'Chinese';
  static const String thai = 'Thai';
  static const String french = 'French';

  // Ambiance Selection Screen
  static const String ambianceTitle = 'Pick Your Vibe';
  static const String ambianceSubtitle = 'Discover restaurants that match your mood';
  
  // Ambiances
  static const String chill = 'Chill';
  static const String romantic = 'Romantic';
  static const String fineDining = 'Fine Dining';
  static const String trendy = 'Trendy';
  static const String business = 'Business';
  static const String casual = 'Casual';
  static const String lively = 'Lively';

  // Dietary Selection Screen
  static const String dietaryTitle = 'Tailor Your Preference';
  static const String dietarySubtitle = 'Discover restaurants that cater to your diet';
  static const String findRestaurants = 'Find Restaurants';
  
  // Dietary Options
  static const String vegetarian = 'Vegetarian';
  static const String vegan = 'Vegan';
  static const String halal = 'Halal';
  static const String pescatarian = 'Pescatarian';
  static const String keto = 'Keto';
  static const String allergies = 'Allergies';
  static const String glutenFree = 'Gluten Free';
  static const String dairyFree = 'Dairy Free';
  static const String nutFree = 'Nut Free';

  // Restaurant List Screen
  static const String searchHint = 'Search restaurants by name...';
  static const String topRated = 'Top Rated';
  static const String nearbyRestaurants = 'Nearby Restaurants';
  static const String recommendedForYou = 'Recommended for you';
  
  // Filters
  static const String cuisine = 'Cuisine';
  static const String dietary = 'Dietary';
  static const String ambience = 'Ambience';
  static const String priceRange = 'Price Range';
  static const String rating = 'Rating';
  static const String distance = 'Distance';

  // Menu Screen
  static const String mains = 'Mains';
  static const String appetizers = 'Appetizers';
  static const String desserts = 'Desserts';
  static const String drinks = 'Drinks';
  static const String recommendedDishes = 'Recommended Dishes';

  // Error Messages
  static const String errorLoadingRestaurants = 'Failed to load restaurants';
  static const String errorLoadingMenu = 'Failed to load menu';
  static const String errorNoInternet = 'No internet connection';
  static const String errorGeneric = 'Something went wrong';
  static const String errorNoResults = 'No restaurants found';

  // Empty States
  static const String emptyRestaurants = 'No restaurants available';
  static const String emptyMenu = 'No menu items available';
  static const String emptySearch = 'No restaurants match your search';

  // Success Messages
  static const String successAddedToFavorites = 'Added to favorites';
  static const String successRemovedFromFavorites = 'Removed from favorites';

  // Units
  static const String miles = 'mi';
  static const String kilometers = 'km';
  static const String currencySymbol = '\$';

  // Days of Week
  static const String monday = 'Monday';
  static const String tuesday = 'Tuesday';
  static const String wednesday = 'Wednesday';
  static const String thursday = 'Thursday';
  static const String friday = 'Friday';
  static const String saturday = 'Saturday';
  static const String sunday = 'Sunday';

  // Time
  static const String open = 'Open';
  static const String closed = 'Closed';
  static const String opensAt = 'Opens at';
  static const String closesAt = 'Closes at';
}