import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/molecules/digit_language_card.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_app.dart';

const _target = """
 [
    {
      "label": "ਪੰਜਾਬੀ",
      "value": "pn_IN",
      "isSelected": false
    },
    {
      "label": "ENGLISH",
      "value": "en_IN",
      "isSelected": true
    }
  ]
  """;
void main() {
  bool languageChangeTriggered = false;
  bool languageChangeSubmitTriggered = false;

  final List list = json.decode(_target);
  List<DigitRowCardModel> languageList =
      list.map((e) => DigitRowCardModel.fromJson(e)).toList();
  group('Digit Language Card ', () {
    testWidgets('Widget is created without errors', (widgetTester) async {
      await widgetTester.pumpWidget(
        WidgetApp(
          child: DigitLanguageCard(
              digitRowCardItems: languageList,
              languageSubmitLabel: 'Continue',
              onLanguageSubmit: () => languageChangeSubmitTriggered =
                  !languageChangeSubmitTriggered,
              onLanguageChange: (data) {
                languageChangeTriggered = !languageChangeTriggered;
              }),
        ),
      );

      expect(
        find.widgetWithText(
          DigitLanguageCard,
          'Continue',
        ),
        findsOneWidget,
      );

// Test case for  LanguageChange Button
      await widgetTester.tap(
        find.text(
          'ENGLISH',
        ),
      );

      await widgetTester.pumpAndSettle();
      expect(
        languageChangeTriggered,
        true,
      );

// Test case for Submit Button
      await widgetTester.tap(
        find.text('Continue'),
      );

      await widgetTester.pumpAndSettle();
      expect(
        languageChangeSubmitTriggered,
        true,
      );
    });
  });
}
