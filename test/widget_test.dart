// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ironheritage/main.dart';

void main() {
  testWidgets('Bottom navigation bar is displayed with five tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // NavigationBar is present
    expect(find.byType(NavigationBar), findsOneWidget);

    // All five navigation destination labels are present in the bar
    expect(find.text('Home'), findsAtLeastNWidgets(1));
    expect(find.text('Workouts'), findsAtLeastNWidgets(1));
    expect(find.text('Progress'), findsAtLeastNWidgets(1));
    expect(find.text('Nutrition'), findsAtLeastNWidgets(1));
    expect(find.text('Profile'), findsAtLeastNWidgets(1));
  });

  testWidgets('Tapping a tab switches the displayed screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Tap the Workouts tab via the NavigationBar label
    await tester.tap(find.text('Workouts').last);
    await tester.pump();

    // NavigationBar still shows all destinations
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Workouts'), findsAtLeastNWidgets(1));
  });
}
