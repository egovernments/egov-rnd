import 'package:digit_components/digit_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

void main() {
  group('Powered by Digit widget', () {
    testWidgets('Widget is created without errors', (widgetTester) async {
      await widgetTester.pumpWidget(const WidgetApp(
          child: PoweredByDigit(
        version: '12.3',
      )));

      expect(
        find.widgetWithImage(
          PoweredByDigit,
          const AssetImage(
            'assets/images/powered_by_digit.png',
            package: 'digit_components',
          ),
        ),
        findsOneWidget,
      );
    });
  });
}
