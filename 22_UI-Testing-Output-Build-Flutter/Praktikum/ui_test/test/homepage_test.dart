// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_test/homepage.dart';

import 'package:ui_test/main.dart';

void main() {
  testWidgets('halaman harus menampilkan text', (WidgetTester widgetTester) async {
    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      )
    );
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Create New Contact'), findsOneWidget);
    
    await widgetTester.tap(find.byIcon(Icons.contacts));
  });
}
