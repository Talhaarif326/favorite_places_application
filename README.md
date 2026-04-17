<div align="center">

# 📍 Favorite Places

> A Flutter app to save and revisit your favorite spots — with photos, GPS coordinates, and an interactive map.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/State-Riverpod-blueviolet)](https://riverpod.dev)
[![SQLite](https://img.shields.io/badge/Storage-SQLite-003B57?logo=sqlite)](https://www.sqlite.org)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

[Features](#-features) · [Tech Stack](#️-tech-stack) · [Setup](#-setup) · [Screenshots](#-screenshots) · [Contributing](#-contributing)

</div>

---

## 📖 Overview

**Favorite Places** is a Flutter application that lets you capture and store the locations that matter to you. Snap a photo with your camera, grab your GPS coordinates or pin a spot on an interactive map, and save it all locally on your device — no internet required after setup.

Built as part of Maximilian Schwarzmüller's Flutter & Dart course on Udemy, this project covers native device features, state management, and local persistence in a real-world app context.

**Built with:** Flutter · Riverpod · SQLite · flutter_map · LocationIQ API

---

## 📸 Screenshots

> 📸 Screenshots coming soon! Drop some in a `screenshots/` folder and update this section.

<!-- Once you have screenshots, use this format:
| Places List | Add New Place | Map Selection | Place Detail |
|-------------|---------------|---------------|--------------|
| ![Places](screenshots/places_list.png) | ![Add](screenshots/add_place.png) | ![Map](screenshots/map_screen.png) | ![Detail](screenshots/place_detail.png) |
-->

---

## ✨ Features

- 📷 **Camera Integration** — Take a photo of your place directly from the app using the device camera
- 📍 **GPS Location Detection** — Automatically grab your current coordinates with one tap
- 🗺️ **Interactive Map Picker** — Manually pin any location on a full interactive map (powered by flutter_map + LocationIQ)
- 🔍 **Reverse Geocoding** — Coordinates are automatically converted to a readable address via the LocationIQ API
- 🗄️ **Local Persistence** — All places are saved on-device using SQLite — your data survives app restarts
- 📋 **Places List** — Browse all your saved places with photo thumbnail and address at a glance
- 🔎 **Place Detail View** — Full-screen photo with a map thumbnail showing the exact location
- 🌑 **Dark Theme** — Clean dark UI with a purple accent and Ubuntu Condensed typography

---

## 🛠️ Tech Stack

| Package | Version | Purpose |
|---|---|---|
| Flutter | 3.x | UI Framework |
| Dart | ^3.10.8 | Programming Language |
| flutter_riverpod | ^3.3.1 | State management (StateNotifier) |
| sqflite | ^2.4.2 | Local SQLite database |
| flutter_map | ^8.3.0 | Interactive map rendering |
| latlong2 | ^0.9.1 | Lat/Lng coordinate model |
| location | ^8.0.1 | Device GPS access |
| http | ^1.6.0 | HTTP requests (reverse geocoding) |
| image_picker | ^1.2.1 | Camera access |
| flutter_dotenv | ^6.0.0 | API key management via `.env` |
| google_fonts | ^8.0.2 | Ubuntu Condensed font |
| path_provider | ^2.1.5 | App document directory |
| path | ^1.9.1 | File path utilities |
| uuid | ^4.5.3 | Unique ID generation |

> **Map provider:** [LocationIQ](https://locationiq.com/) — used for static map previews, tile rendering, and reverse geocoding.

---

## 🚀 Setup

### Prerequisites

- Flutter SDK `>= 3.x` — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Android Studio / VS Code with Flutter & Dart extensions
- A free [LocationIQ API key](https://locationiq.com/)

### Clone & Run

```bash
# Clone the repo
git clone https://github.com/Talhaarif326/favorite_places_application.git

# Navigate into the project
cd favorite_places_application

# Install dependencies
flutter pub get
```

### Environment Setup

Create a `.env` file in the root of the project:

```
apiKey=YOUR_LOCATIONIQ_API_KEY_HERE
```

> ⚠️ Never commit your `.env` file — it's already covered by `.gitignore`.

```bash
# Run the app
flutter run
```

### Build for Release

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

---

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point, theme setup, Riverpod ProviderScope
├── models/
│   └── places_models.dart       # PlacesModels data class with UUID generation
├── providers/
│   └── places_provider.dart     # Riverpod StateNotifier + SQLite CRUD logic
├── screens/
│   ├── places_screen.dart       # Home screen — list of all saved places
│   ├── add_new_place.dart       # Form screen — add title, photo, and location
│   ├── place_detail_screen.dart # Full detail view of a saved place
│   └── map_screen.dart          # Interactive flutter_map (select or view mode)
└── widgets/
    ├── image_input.dart         # Camera capture widget
    ├── location_input.dart      # GPS + map picker + static map preview
    └── places_list.dart         # ListView of saved places with thumbnails
```

---

## 🤝 Contributing

Contributions are welcome!

1. **Fork** the repository
2. **Create** a branch: `git checkout -b feature/your-feature-name`
3. **Commit** your changes: `git commit -m 'feat: add your feature'`
4. **Push** to your branch: `git push origin feature/your-feature-name`
5. **Open a Pull Request**

---

## 📝 Changelog

### v1.0.0 — April 2026
- ✨ Initial release
- 📷 Camera integration for place photos
- 📍 GPS + manual map location picking
- 🗄️ SQLite persistence across sessions
- 🗺️ LocationIQ reverse geocoding and map tiles

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🙌 Credits

- Built by [Talhaarif326](https://github.com/Talhaarif326)
- Part of [Maximilian Schwarzmüller's Flutter & Dart course](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/) on Udemy
- Maps powered by [LocationIQ](https://locationiq.com/) + [flutter_map](https://pub.dev/packages/flutter_map)

---

<div align="center">
  <sub>Made with ❤️ using Flutter</sub>
</div>
