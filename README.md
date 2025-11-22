🍽️ Restaurant Recommendation App
A Flutter application designed to help users discover restaurants based on their cuisine preferences, dietary restrictions, and dish recommendations. The app delivers a personalized experience through preference-based filtering, interactive UI, and modern Flutter architecture.

📌 App Flow & Pages
🛬 1. Onboarding Screens

Select preferred cuisines and dietary preferences (Vegan, Gluten-free, Keto, etc.)
Captures user tastes to personalize restaurant recommendations
Includes custom chips, selection states, and UI feedback

<p align="center">
  <img src="https://github.com/user-attachments/assets/dbb460ea-9864-4492-ac17-ff8c438a1fb3" width="250" alt="Cuisine Selection"/>
  <img src="https://github.com/user-attachments/assets/0112db30-eba5-4852-a765-83f86d4f7517" width="250" alt="Dietary Preferences"/>
</p>

🏠 2. Home / Restaurant Listing Screen

Displays a list of restaurants based on user's selected preferences
Each restaurant card shows:

Name, description, cuisine type
Ratings, distance, pricing level
Tags indicating dietary suitability



<p align="center">
  <img src="https://github.com/user-attachments/assets/04608195-2712-4d27-bb42-2b0728e25ddf" width="250" alt="Restaurant List"/>
</p>

🍽️ 3. Restaurant Overview Screen

Custom-designed screen (not in original design) showing:

Restaurant details, images, rating, address, opening hours
Featured dishes, popular menu items
Filter tags like Vegan, Spicy, Dairy-Free, Keto



<p align="center">
  <img src="https://github.com/user-attachments/assets/57684d35-76f1-4c10-9715-295afe900778" width="250" alt="Restaurant Overview"/>
</p>

⭐ 4. Recommended Dishes Screen

Displays dishes recommended for that specific restaurant
Includes:

Dietary tags
Dish name, description, price, rating
Model-driven dish filtering based on user preferences
<img width="250" alt="Screenshot_1763809930" src="https://github.com/user-attachments/assets/8ecfce1c-20b8-4b33-897f-f35db3b6349f" />





ℹ️ 5. Restaurant Detail Bottom Sheet


Shows quick dish insights from menu
Built using reusable widgets for better scalability

<p align="center">
  <img src="https://github.com/user-attachments/assets/fc7ee306-c575-463f-887d-922995e26fb7" width="250" alt="Detail Bottom Sheet"/>
</p>

🧠 Core Features
FeatureDescriptionPersonalized PreferencesUser-selected cuisines & diet mapped to recommendationsSmart FilteringRestaurant list updates dynamically based on preferencesModular WidgetsReusable components like RestaurantCard, RatingStarWidgetProvider State ManagementClean data handling, selection retention, and UI updatesScalable ArchitectureOrganized folder structure for maintainabilityResponsive DesignAdjusts across different screen sizes & devices

🛠 Architecture Overview
lib/
├── models/              # Data models (Restaurant, Dish, Cuisine)
├── screens/             # All app screens
├── widgets/             # Reusable UI components
├── providers/           # State management with Provider
├── utils/               # Constants, helpers, themes
└── main.dart           # App entry point

🚀 Getting Started
Prerequisites
bashFlutter SDK: >=3.0.0
Dart SDK: >=3.0.0
Installation

Clone the repository

bashgit clone https://github.com/yourusername/restaurant_recommendation.git
cd restaurant_recommendation

Install dependencies

bashflutter pub get

Run the app

bashflutter run

📦 Dependencies
yamldependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  google_fonts: ^6.0.0
  # Add your other dependencies

✨ Key Highlights

✅ Clean, organized code structure
✅ Custom UI components for consistency
✅ State management with Provider
✅ Smooth navigation and transitions
✅ Responsive design principles
✅ Dietary filter integration
✅ Rating system implementation


🎯 Future Enhancements

🔄 Backend API integration
📍 Real-time location services
💾 User favorites and history
🔔 Push notifications for offers
🗺️ Map view for restaurants
📱 Social sharing features


🤝 Contributing
Contributions, issues, and feature requests are welcome!

👤 Author
Your Name

GitHub: @yourusername
LinkedIn: Your Profile


📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments

Flutter team for the amazing framework
Design inspiration from modern food delivery apps
Community support and resources


<p align="center">Made with ❤️ using Flutter</p>

📸 All Screenshots
<details>
<summary>Click to view all screenshots</summary>
Onboarding Flow
<p align="center">
  <img src="https://github.com/user-attachments/assets/dbb460ea-9864-4492-ac17-ff8c438a1fb3" width="200"/>
  <img src="https://github.com/user-attachments/assets/0112db30-eba5-4852-a765-83f86d4f7517" width="200"/>
</p>
Main Screens
<p align="center">
  <img src="https://github.com/user-attachments/assets/04608195-2712-4d27-bb42-2b0728e25ddf" width="200"/>
  <img src="https://github.com/user-attachments/assets/57684d35-76f1-4c10-9715-295afe900778" width="200"/>
</p>
Detail Screens
<p align="center">
  <img src="https://github.com/user-attachments/assets/49c196f6-95c9-4a8e-b861-34af10d417a9" width="200"/>
  <img src="https://github.com/user-attachments/assets/fc7ee306-c575-463f-887d-922995e26fb7" width="200"/>
</p>
</details>

Note: The images are now displayed at width="250" (or "200" in the collapsible section) which makes them smaller and more standard for GitHub README files. This keeps them readable while not taking up too much vertical space. You can adjust the width values (150-300 are common ranges) based on your preference.
