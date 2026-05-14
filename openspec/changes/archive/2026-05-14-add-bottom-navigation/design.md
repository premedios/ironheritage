## Context

Iron Heritage is a Flutter app using Material 3 with a custom theme (Gunmetal Grey primary, Foundry Crimson secondary). The current entry point (`lib/main.dart`) renders a single `MyHomePage` widget — a counter demo with no navigation. The app has no screens beyond this placeholder. This design establishes the primary navigation shell before any real feature screens are built.

## Goals / Non-Goals

**Goals:**

- Introduce a `NavigationBar` (Material 3) shell widget (`AppShell`) that owns tab-switching state
- Provide five named placeholder screens: Home, Workouts, Progress, Nutrition, Profile
- Wire `MaterialApp.home` to the new shell so the app starts with proper navigation
- Ensure the navigation bar visually matches the existing theme without custom overrides

**Non-Goals:**

- Implementing real content for any of the five tab screens (placeholder only)
- Named route / go_router navigation (shell manages index state only for now)
- Deep linking or back-stack behaviour per tab
- Animations or custom tab transitions beyond Flutter defaults

## Decisions

### 1. Use `NavigationBar` (Material 3) over `BottomNavigationBar`

The app already sets `useMaterial3: true`. `NavigationBar` is the M3-native component with correct token mapping to the existing `colorScheme`. `BottomNavigationBar` is the M2 equivalent and would require manual colour overrides to match the theme.

**Alternatives considered:**

- `BottomNavigationBar` — rejected; deprecated in favour of `NavigationBar` for M3 apps.
- Custom tab bar — rejected; no product requirement for non-standard behaviour at this stage.

### 2. `AppShell` as a `StatefulWidget` with `_selectedIndex`

A simple `StatefulWidget` that stores an integer index and calls `setState` on tab change is sufficient. No state management library is needed because tab state is UI-local and does not need to be shared across the widget tree at this stage.

**Alternatives considered:**

- Provider / Riverpod — over-engineered for a single integer; adds dependency without benefit now.
- `IndexedStack` vs `PageView` — `IndexedStack` is chosen to preserve each tab's scroll position without rebuilding.

### 3. File layout — `lib/navigation/` directory

Group the shell and tab screens under `lib/navigation/` to keep navigation concerns separate from future feature directories (`lib/workouts/`, `lib/profile/`, etc.).

```
lib/
  navigation/
    app_shell.dart          # AppShell widget (NavigationBar + IndexedStack)
    screens/
      home_screen.dart
      workouts_screen.dart
      progress_screen.dart
      nutrition_screen.dart
      profile_screen.dart
  main.dart                 # updated: home: const AppShell()
  theme.dart                # unchanged
```

### 4. Navigation bar label font — `NavigationBarThemeData` override

**Principle:** Space Mono is reserved for data values (numbers: weights, reps, calories). Roboto Slab is used for all readable words in the UI, including navigation labels.

The `NavigationBar` widget reads `labelMedium` from the theme by default, which is Space Mono Bold — correct for data elements but wrong for word labels like "Home" and "Workouts". Changing `labelMedium` globally would affect all widgets using that token. Instead, override only the `NavigationBar` via `NavigationBarThemeData.labelTextStyle` in `theme.dart`.

```dart
navigationBarTheme: NavigationBarThemeData(
  labelTextStyle: WidgetStateProperty.all(
    GoogleFonts.robotoSlab(),
  ),
),
```

**Alternatives considered:**

- Change `labelMedium` globally to Roboto Slab — rejected; breaks Space Mono for data-element contexts elsewhere in the app.
- Use Alfa Slab One — rejected; display face, illegible at 12sp nav label size.

### 5. Icons

Use `Icons.*` from the Flutter SDK — no icon package needed.

| Tab       | Icon                       |
|-----------|----------------------------|
| Home      | `Icons.home_outlined` / `Icons.home` (selected) |
| Workouts  | `Icons.fitness_center_outlined` / `Icons.fitness_center` |
| Progress  | `Icons.show_chart` |
| Nutrition | `Icons.restaurant_outlined` / `Icons.restaurant` |
| Profile   | `Icons.person_outline` / `Icons.person` |

## Risks / Trade-offs

- **`IndexedStack` memory**: All five screens are kept in memory simultaneously. At this stage all screens are placeholders (minimal widgets), so the cost is negligible. Re-evaluate if heavy screens cause memory pressure.  
  → Mitigation: Switch to lazy `PageView` or conditional rendering when screens grow.

- **No per-tab navigation stack**: Tapping a tab always returns to the tab root. If a tab later needs its own push/pop stack, `Navigator` per tab or a router solution (go_router) will be needed.  
  → Mitigation: Document this limitation; adopt go_router in a future change when deep linking or per-tab stacks are required.

## Migration Plan

1. Create `lib/navigation/app_shell.dart` and five screen files under `lib/navigation/screens/`.
2. Update `lib/main.dart`: change `home: const MyHomePage(...)` to `home: const AppShell()`. Remove `MyHomePage` class.
3. No data migration or backend changes required.
4. Run `flutter analyze` and `flutter test` to confirm no regressions.

**Rollback**: Revert changes to `main.dart` and delete the `lib/navigation/` directory.
