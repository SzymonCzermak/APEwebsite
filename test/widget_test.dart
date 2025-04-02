import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apewebsite/main.dart';

void main() {
  testWidgets('MyWebsite displays HomePage by default', (WidgetTester tester) async {
    // Uruchamiamy aplikację
    await tester.pumpWidget(const MyWebsite());

    // Sprawdzamy, czy wyświetlany jest tekst z HomePage
    expect(find.text('Witaj na stronie głównej'), findsOneWidget);
  });
}
