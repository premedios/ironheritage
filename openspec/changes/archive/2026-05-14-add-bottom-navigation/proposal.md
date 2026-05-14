## Why

Iron Heritage currently has no navigation structure — the app launches into a single demo screen with no way to move between core features. Adding a bottom navigation bar establishes the primary navigation shell that every subsequent feature (workouts, progress tracking, nutrition, and profiles) will live inside.

## What Changes

- Add a persistent `BottomNavigationBar` (or `NavigationBar` for Material 3) to the app shell with five tabs: Home, Workouts, Progress, Nutrition, and Profile
- Replace the current `MyHomePage` counter demo with a proper shell widget that manages the selected tab index and renders the appropriate screen
- Add five placeholder screen widgets — one per tab — as the foundation for future feature work
- Update `MaterialApp.home` to point to the new shell widget

## Capabilities

### New Capabilities

- `bottom-navigation`: Persistent bottom navigation bar shell with five tabs (Home, Workouts, Progress, Nutrition, Profile), tab switching state management, and per-tab screen routing

### Modified Capabilities

<!-- No existing specs are being modified — the specs/ directory is empty and this is the first structural feature. -->

## Impact

- `lib/main.dart`: Replace `MyHomePage` with new `AppShell` widget; update `MaterialApp.home`
- `lib/navigation/`: New directory for the shell widget and tab screen placeholders
- Theme (`lib/theme.dart`): No changes required — `BottomNavigationBar` / `NavigationBar` will inherit existing `colorScheme` tokens (primary = Gunmetal Grey, secondary = Foundry Crimson)
- No external dependencies added
