import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

void main() {
  group(
    'DigitOutLineButton Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          bool primary = false;
          await widgetTester.pumpWidget(
            WidgetApp(
              child: DigitOutLineButton(
                  label: 'Button',
                  onPressed: () {
                    primary = !primary;
                  }),
            ),
          );
          expect(
            find.widgetWithText(DigitOutLineButton, 'Button'),
            findsOneWidget,
          );
          await widgetTester
              .tap(find.widgetWithText(DigitOutLineButton, 'Button'));
          await widgetTester.pumpAndSettle();
          expect(primary, true);
        },
      );
    },
  );
}
