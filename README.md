# Spotify UI Replica - Flutter

## Description
This project is a high-fidelity UI prototype of the Spotify mobile application built with Flutter. It focuses on replicating the visual design and basic navigation structure of the core screens.

**Note:** This is a **UI-only prototype**. It uses static data and does not include:
- Audio playback functionality.
- Real-time search or API integrations.
- Backend, database, or authentication systems.

## Technology Stack
- **Framework**: Flutter
- **Language**: Dart
- **Target Platforms**: Web (Verified), Android (Build support)
- **Design Tokens**: Custom Design System (`AppColors`, `AppTextStyles`, `AppDimens`)
- **Fonts**: Figtree (with system fallback)
- **Dependencies**: `font_awesome_flutter` (Limited use for specific icons)

## Project Structure
```text
lib/
├── app/
│   └── app_shell.dart          # Main navigation wrapper (IndexedStack, BottomNav, MiniPlayer)
├── core/
│   ├── data/
│   │   └── mock_data.dart      # Static content for all screens
│   ├── theme/
│   │   ├── app_colors.dart     # Design color tokens
│   │   ├── app_dimens.dart     # Spacing and size tokens
│   │   └── app_text_styles.dart # Typography tokens
│   └── widgets/                # Shared UI components (AppAvatar, MusicPlaceholder, etc.)
└── features/
    ├── drawer/
    │   └── profile_drawer.dart # User profile sidebar
    ├── home/
    │   ├── home_screen.dart     # Home screen implementation
    │   └── widgets/            # Home-specific components (ShortcutTile, StationCard, etc.)
    ├── library/
    │   ├── library_screen.dart  # Your Library screen implementation
    │   └── widgets/            # Library-specific components (LibraryHeader, SortRow, etc.)
    └── search/
        ├── search_screen.dart   # Search screen implementation
        └── widgets/            # Search-specific components (SearchField, CategoryTile, etc.)
test/
└── widget_test.dart            # Automated UI/Widget tests
```

## Getting Started

### Prerequisites
- Flutter SDK installed and configured.
- Chrome browser (for web target) or Android Emulator/Device.

### Installation & Execution
1. **Clone the repository** and navigate to the root folder.
2. **Fetch dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the application**:
   - For Web: `flutter run -d chrome`
   - For Android: `flutter run`
4. **Verify Code Quality**:
   ```bash
   flutter analyze
   ```
5. **Run Tests**:
   ```bash
   flutter test
   ```

### Production Builds
- **Web Release**: `flutter build web --release` (Output: `build/web`)
- **Android APK**: `flutter build apk --release` (Output: `build/app/outputs/flutter-apk/app-release.apk`)

## Architecture Summary
- **AppShell**: The root widget that manages the `IndexedStack` for tab switching, preserving the scroll state of each screen.
- **Navigation**: A custom `BottomNav` controls the active index of the `IndexedStack`.
- **Global Components**: `MiniPlayer` is persisted across all tabs. `ProfileDrawer` is triggered via `Scaffold.drawer` through callbacks from avatar widgets in each screen.
- **Design System**: All styling is driven by centralized tokens in `lib/core/theme` to ensure pixel-perfect consistency.

## Limitations
This application is strictly a visual prototype. The following features are **out of scope** per the PRD:
- No audio engine or music streaming.
- No functional search logic (Search field is static).
- No persistent data storage or user accounts.
- No external API calls.
