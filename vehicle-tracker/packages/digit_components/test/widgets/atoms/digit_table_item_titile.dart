import 'package:digit_components/widgets/atoms/digit_table_item_title.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

void main() {
  group(
    'DigitTableItemTitle Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: DigitTableItemTitle(
                label: 'Title',
              ),
            ),
          );
          expect(
            find.widgetWithText(DigitTableItemTitle, 'Title'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
