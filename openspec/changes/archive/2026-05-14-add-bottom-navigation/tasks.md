## 1. File Structure Setup

- [x] 1.1 Create new github branch 'bottom-navigation'
- [x] 1.2 Create directory `lib/navigation/screens/`
- [x] 1.3 Create `lib/navigation/app_shell.dart` (empty file, to be filled in task 2)
- [x] 1.4 Create `lib/navigation/screens/home_screen.dart` with a minimal placeholder `Scaffold`
- [x] 1.5 Create `lib/navigation/screens/workouts_screen.dart` with a minimal placeholder `Scaffold`
- [x] 1.6 Create `lib/navigation/screens/progress_screen.dart` with a minimal placeholder `Scaffold`
- [x] 1.7 Create `lib/navigation/screens/nutrition_screen.dart` with a minimal placeholder `Scaffold`
- [x] 1.8 Create `lib/navigation/screens/profile_screen.dart` with a minimal placeholder `Scaffold`

## 2. AppShell Widget

- [x] 2.1 Implement `AppShell` as a `StatefulWidget` in `lib/navigation/app_shell.dart`
- [x] 2.2 Add `_selectedIndex` integer state, initialised to `0` (Home)
- [x] 2.3 Build an `IndexedStack` with the five screen widgets as children (preserves scroll position per spec)
- [x] 2.4 Add `NavigationBar` with five `NavigationDestination` entries: Home, Workouts, Progress, Nutrition, Profile
- [x] 2.5 Assign correct `Icons.*` to each destination (outlined for unselected, filled for selected)
- [x] 2.6 Wire `NavigationBar.onDestinationSelected` to call `setState(() => _selectedIndex = index)`
- [x] 2.7 Set `NavigationBar.selectedIndex` to `_selectedIndex`

## 3. Entry Point Update

- [x] 3.1 In `lib/main.dart`, import `app_shell.dart`
- [x] 3.2 Replace `home: const MyHomePage(title: 'Iron Heritage Home Page')` with `home: const AppShell()`
- [x] 3.3 Remove the `MyHomePage` and `_MyHomePageState` classes from `main.dart`

## 4. Typography

- [x] 4.1 Add `NavigationBarThemeData` to `theme.dart` with `labelTextStyle` set to `GoogleFonts.robotoSlab()`

## 5. Verification

- [x] 4.1 Run `flutter analyze` — confirm zero errors and zero warnings
- [x] 4.2 Run `flutter test` — confirm all existing tests pass
- [x] 4.3 Launch app on simulator/device — confirm navigation bar is visible on launch with Home selected
- [x] 4.4 Tap each tab — confirm correct screen is displayed and destination is highlighted
- [x] 4.5 Scroll down on a tab, switch to another tab, return — confirm scroll position is preserved
