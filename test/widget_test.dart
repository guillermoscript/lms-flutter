import 'package:flutter_test/flutter_test.dart';
import 'package:lms_flutter/screens/login/login.dart';
import 'package:lms_flutter/app.dart';

void main() {
  testWidgets('App widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that our app is showing the Login widget.
    expect(find.byType(Login), findsOneWidget);
  });
}
