# Flutter Weather App — Project Summary for CV

## 🏷️ Title
**Flutter Weather App** — Real-Time Weather Forecast with Material UI

## 📝 Description
This project is a sleek, fully functional Flutter weather application designed using **Material UI principles**. It fetches real-time weather data using the **OpenWeatherMap API** and displays detailed current conditions, temperature trends, and hourly forecasts. The app integrates smooth animations, responsive layouts, and chart visualizations, showcasing professional Flutter development and API integration skills.

## ⚙️ Functionalities
- 🌤️ **Real-Time Weather Data:** Fetches live temperature, humidity, wind speed, and conditions from OpenWeatherMap API.
- 🧭 **City-Based Weather Search:** Displays current and forecast data for a selected city (default: New Delhi).
- ⏳ **Splash Screen:** A loading screen with app logo and animation before navigating to the main dashboard.
- 📊 **Hourly Forecast Chart:** Uses the `fl_chart` library to render an animated temperature line chart.
- 🌈 **Detailed Weather View:** Separate detail screen showing expanded metrics like humidity and wind speed.
- 📍 **Future Expansion Ready:** Easily extendable to add geolocation support using the `geolocator` package.

## 🛠️ Tech Stack
- **Framework:** Flutter (Dart)
- **UI Toolkit:** Material Design Components
- **API:** OpenWeatherMap (REST API)
- **Libraries Used:**
  - `http` — for REST API calls
  - `geolocator` — for location-based weather fetching (optional)
  - `fl_chart` — for displaying temperature graphs
  - `flutter_spinkit` — for loading animations

## 🎨 UI Design
- Clean and minimal **Material Design layout**.
- Dark-themed background with contrasting text.
- Gradient weather cards for a polished professional look.
- Responsive design adaptable to both mobile and tablet displays.

## 🚀 Project Flow
1. **Splash Screen** → Displays app logo and transitions to the main dashboard.
2. **Home Screen** → Fetches weather data and shows charts, forecasts, and summaries.
3. **Detail Screen** → Displays deeper metrics (temperature, humidity, wind speed).

## 📁 Folder Structure
```
lib/
 ├── main.dart
 ├── screens/
 │   ├── splash_screen.dart
 │   ├── home_screen.dart
 │   ├── detail_screen.dart
 ├── widgets/
 │   ├── weather_card.dart
 │   ├── temperature_chart.dart
 ├── models/
 │   ├── weather_model.dart
 ├── services/
 │   ├── weather_service.dart
 ├── utils/
 │   ├── constants.dart
```

## 🧩 Key Highlights
- Demonstrates **REST API integration** in Flutter.
- Implements **chart visualization** and **data parsing**.
- Uses **state management via setState** (ideal for beginner to intermediate Flutter devs).
- Clean modular structure following best practices.
- Ideal for inclusion in a **Flutter Developer CV or Portfolio Project**.

---
💡 *This project shows your capability to design, structure, and integrate dynamic data-driven UI in Flutter apps, making it a strong addition to your Flutter portfolio.*
