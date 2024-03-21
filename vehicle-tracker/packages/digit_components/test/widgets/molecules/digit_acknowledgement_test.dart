import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

void main() {
  group(
    'DigitAcknowledgement Test',
    () {
      late bool actionTriggered;

      setUp(() {
        actionTriggered = false;
      });

      testWidgets(
        'Success Acknowledgement is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            WidgetApp(
              child: DigitAcknowledgement.success(
                action: () => actionTriggered = !actionTriggered,
                actionLabel: 'DIGIT_ACKNOWLEDGEMENT_ACTION_LABEL',
                description: 'DIGIT_ACKNOWLEDGEMENT_DESCRIPTION',
                label: 'DIGIT_ACKNOWLEDGEMENT_LABEL',
              ),
            ),
          );

          expect(
            find.widgetWithText(
              DigitAcknowledgement,
              'DIGIT_ACKNOWLEDGEMENT_LABEL',
            ),
            findsOneWidget,
          );

          expect(
            find.widgetWithIcon(
              DigitAcknowledgement,
              Icons.check_circle,
            ),
            findsOneWidget,
          );

          expect(actionTriggered, false);
          await widgetTester.tap(
            find.widgetWithText(
              DigitElevatedButton,
              'DIGIT_ACKNOWLEDGEMENT_ACTION_LABEL',
            ),
          );

          expect(actionTriggered, true);
        },
      );

      testWidgets(
        'Error Acknowledgement is created without errors',
            (widgetTester) async {
          await widgetTester.pumpWidget(
            WidgetApp(
              child: DigitAcknowledgement.error(
                action: () => actionTriggered = !actionTriggered,
                actionLabel: 'DIGIT_ACKNOWLEDGEMENT_ACTION_LABEL',
                description: 'DIGIT_ACKNOWLEDGEMENT_DESCRIPTION',
                label: 'DIGIT_ACKNOWLEDGEMENT_LABEL',
              ),
            ),
          );

          expect(
            find.widgetWithText(
              DigitAcknowledgement,
              'DIGIT_ACKNOWLEDGEMENT_LABEL',
            ),
            findsOneWidget,
          );

          expect(
            find.widgetWithIcon(
              DigitAcknowledgement,
              Icons.error,
            ),
            findsOneWidget,
          );

          expect(actionTriggered, false);
          await widgetTester.tap(
            find.widgetWithText(
              DigitElevatedButton,
              'DIGIT_ACKNOWLEDGEMENT_ACTION_LABEL',
            ),
          );

          expect(actionTriggered, true);
        },
      );
    },
  );
}
