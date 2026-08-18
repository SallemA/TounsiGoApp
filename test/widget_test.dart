import 'package:flutter_test/flutter_test.dart';
import 'package:tounsigo/app/app.dart';

void main() {
  testWidgets('TounsiGo onboarding starts successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TounsiGoApp());

    expect(find.text('TounsiGo'), findsOneWidget);
    expect(find.text('Sprich Tounsi.\nVon Anfang an.'), findsOneWidget);
    expect(find.text('Weiter'), findsOneWidget);
  });
}
