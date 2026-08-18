// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:tounsigo/app/app.dart';

void main() {
  testWidgets('TounsiGo starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const TounsiGoApp());

    expect(find.text('TounsiGo'), findsOneWidget);
    expect(
      find.text('Tounsi hören, verstehen und sprechen.'),
      findsOneWidget,
    );
  });
}
