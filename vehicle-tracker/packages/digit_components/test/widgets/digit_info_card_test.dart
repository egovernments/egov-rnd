import 'package:digit_components/widgets/digit_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_app.dart';

void main() {
  group(
    'DigitInfoCard Test',
    () {
      testWidgets(
        'Widget is created without errors',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const WidgetApp(
              child: DigitInfoCard(
                icon: Icons.info,
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                description:
                    'Click on Register New Household button to add details.',
                title: 'Match not found!',
              ),
            ),
          );
          expect(
            find.widgetWithText(DigitInfoCard, 'Match not found!'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
