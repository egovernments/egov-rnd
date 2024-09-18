import 'package:digit_components/widgets/digit_search_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

void main() {
  group(
    'DigitSearchBar Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: DigitSearchBar(
                hintText: 'Enter the name of household head',
              ),
            ),
          );
          expect(
            find.widgetWithText(
                DigitSearchBar, 'Enter the name of household head'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
