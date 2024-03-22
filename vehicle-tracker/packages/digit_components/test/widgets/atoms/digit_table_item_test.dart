import 'package:digit_components/widgets/atoms/digit_table_item.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

void main() {
  group(
    'DigitTableItem Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: DigitTableItem(
                content: 'Male',
                index: 0,
                isColored: true,
                width: 140,
              ),
            ),
          );
          expect(
            find.widgetWithText(DigitTableItem, 'Male'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
