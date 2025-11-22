# 🍽️ Restaurant Recommendation App

A Flutter application designed to help users discover restaurants based on their cuisine preferences, dietary restrictions, and dish recommendations. The app delivers a personalized experience through preference-based filtering, interactive UI, and modern Flutter architecture.

---

## 📌 App Flow & Pages

### 🛬 1. Onboarding Screens
- Select preferred **cuisines** and **dietary preferences** (Vegan, Gluten-free, Keto, etc.)
- Captures user tastes to personalize restaurant recommendations.
- Includes custom chips, selection states, and UI feedback.

  

---<img width="1080" height="2424" alt="Screenshot_1763809918" src="https://github.com/user-attachments/assets/dbb460ea-9864-4492-ac17-ff8c438a1fb3" />
<img width="1080" height="2424" alt="Screenshot_1763809922" src="https://github.com/user-attachments/assets/0112db30-eba5-4852-a765-83f86d4f7517" />


### 🏠 2. Home / Restaurant Listing Screen
- Displays a list of restaurants based on user's selected preferences.
- Each restaurant card shows:
  - Name, description, cuisine type  
  - Ratings, distance, pricing level  
  - Tags indicating dietary suitability  <img width="1080" height="2424" alt="Screenshot_1763809910" src="https://github.com/user-attachments/assets/04608195-2712-4d27-bb42-2b0728e25ddf" />


---

### 🍽️ 3. Restaurant Overview Screen
- Custom-designed screen (not in original design) showing:<img width="1080" height="2424" alt="Screenshot_1763809925" src="https://github.com/user-attachments/assets/57684d35-76f1-4c10-9715-295afe900778" />

  - Restaurant details, images, rating, address, opening hours  
  - Featured dishes, popular menu items  
  - Filter tags like Vegan, Spicy, Dairy-Free, Keto
 
  -  

---

### ⭐ 4. Recommended Dishes Screen
- Displays dishes recommended for that specific restaurant.
- Includes:
  - Dietary tags  
  - Dish name, description, price, rating  
  - Model-driven dish filtering based on user preferences<img width="1080" height="2424" alt="Screenshot_1763809932" src="https://github.com/user-attachments/assets/49c196f6-95c9-4a8e-b861-34af10d417a9" />


---
<img width="1080" height="2424" alt="Screenshot_1763809936" src="https://github.com/user-attachments/assets/fc7ee306-c575-463f-887d-922995e26fb7" />

### ℹ️ 5. Restaurant Detail Bottom Sheet (Optional)
- Shows quick dish insights from menu
- Built using reusable widgets for better scalability

- 

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
