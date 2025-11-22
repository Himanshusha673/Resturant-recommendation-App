# 🍽️ Restaurant Recommendation App

A Flutter application designed to help users discover restaurants based on their cuisine preferences, dietary restrictions, and dish recommendations. The app delivers a personalized experience through preference-based filtering, interactive UI, and modern Flutter architecture.

---

## 📌 App Flow & Pages

### 🛬 1. Onboarding Screens
- Select preferred **cuisines** and **dietary preferences** (Vegan, Gluten-free, Keto, etc.)
- Captures user tastes to personalize restaurant recommendations.
- Includes custom chips, selection states, and UI feedback.

---

### 🏠 2. Home / Restaurant Listing Screen
- Displays a list of restaurants based on user's selected preferences.
- Each restaurant card shows:
  - Name, description, cuisine type  
  - Ratings, distance, pricing level  
  - Tags indicating dietary suitability  

---

### 🍽️ 3. Restaurant Overview Screen
- Custom-designed screen (not in original design) showing:
  - Restaurant details, images, rating, address, opening hours  
  - Featured dishes, popular menu items  
  - Filter tags like Vegan, Spicy, Dairy-Free, Keto  

---

### ⭐ 4. Recommended Dishes Screen
- Displays dishes recommended for that specific restaurant.
- Includes:
  - Dietary tags  
  - Dish name, description, price, rating  
  - Model-driven dish filtering based on user preferences

---

### ℹ️ 5. Restaurant Detail Bottom Sheet (Optional)
- Shows quick dish insights from menu
- Built using reusable widgets for better scalability

---

## 🧠 Core Features

| Feature | Description |
|---------|-------------|
| Personalized Preferences | User-selected cuisines & diet mapped to recommendations |
| Smart Filtering | Restaurant list updates dynamically based on preferences |
| Modular Widgets | Reusable components like RestaurantCard, RatingStarWidget |
| Provider State Management | Clean data handling, selection retention, and UI updates |
| Scalable Architecture | Organized folder structure for maintainability |
| Responsive Design | Adjusts across different screen sizes & devices |

---

## 🛠 Architecture Overview
