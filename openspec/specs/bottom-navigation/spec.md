## ADDED Requirements

### Requirement: App displays a persistent bottom navigation bar with five tabs
The system SHALL render a `NavigationBar` at the bottom of every screen containing exactly five destinations: Home, Workouts, Progress, Nutrition, and Profile — in that order.

#### Scenario: Navigation bar is visible on app launch
- **WHEN** the app is launched
- **THEN** a bottom navigation bar with five labelled destinations SHALL be visible without any user interaction

#### Scenario: Correct tab labels and icons are displayed
- **WHEN** the navigation bar is rendered
- **THEN** each destination SHALL display its label (Home, Workouts, Progress, Nutrition, Profile) and a corresponding icon

### Requirement: Tapping a tab navigates to the corresponding screen
The system SHALL switch the displayed screen to match the selected tab when the user taps a destination in the navigation bar.

#### Scenario: Tap Home tab
- **WHEN** the user taps the Home destination
- **THEN** the Home screen SHALL be displayed and the Home destination SHALL appear selected

#### Scenario: Tap Workouts tab
- **WHEN** the user taps the Workouts destination
- **THEN** the Workouts screen SHALL be displayed and the Workouts destination SHALL appear selected

#### Scenario: Tap Progress tab
- **WHEN** the user taps the Progress destination
- **THEN** the Progress screen SHALL be displayed and the Progress destination SHALL appear selected

#### Scenario: Tap Nutrition tab
- **WHEN** the user taps the Nutrition destination
- **THEN** the Nutrition screen SHALL be displayed and the Nutrition destination SHALL appear selected

#### Scenario: Tap Profile tab
- **WHEN** the user taps the Profile destination
- **THEN** the Profile screen SHALL be displayed and the Profile destination SHALL appear selected

### Requirement: Selected tab is visually highlighted
The system SHALL visually distinguish the currently selected tab from unselected tabs using the app's `colorScheme` without custom colour overrides.

#### Scenario: Active tab indicator
- **WHEN** a tab is selected
- **THEN** the selected destination SHALL render with the active indicator styled according to the Material 3 `NavigationBar` defaults derived from the existing `colorScheme`

### Requirement: Tab scroll position is preserved when switching tabs
The system SHALL preserve each tab screen's scroll position when the user switches away from a tab and then returns to it.

#### Scenario: Return to previously visited tab
- **WHEN** the user scrolls down on any tab screen and then navigates to a different tab and back
- **THEN** the original tab screen SHALL be in the same scroll position as when the user left it

### Requirement: Home is the default selected tab on app launch
The system SHALL display the Home tab as selected when the app first launches.

#### Scenario: App launch default tab
- **WHEN** the app is launched
- **THEN** the Home destination SHALL be selected and the Home screen SHALL be displayed
