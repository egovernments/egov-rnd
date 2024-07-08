import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'widget_app.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Digit Dialog', () {
    const testButton = 'Test Button';
    const alertTitle = 'Test title';
    const content = 'Dialog content';
    const primaryActionLabel = 'Primary';
    const secondaryActionLabel = 'Secondary';

    Future<void> buildTester(
      WidgetTester widgetTester, {
      MockNavigatorObserver? mockObserver,
      void Function(BuildContext context)? primaryAction,
      void Function(BuildContext context)? secondaryAction,
    }) async {
      await widgetTester.pumpWidget(
        WidgetApp(
          navigatorObserver: mockObserver,
          child: Builder(
            builder: (context) => ElevatedButton(
              child: const Text(testButton),
              onPressed: () => showDialog(
                context: context,
                builder: (_) => DigitDialog(
                  options: DigitDialogOptions(
                    title: const Text(alertTitle),
                    content: const Text(content),
                    primaryAction: DigitDialogActions(
                      label: primaryActionLabel,
                      action: primaryAction,
                    ),
                    secondaryAction: DigitDialogActions(
                      label: secondaryActionLabel,
                      action: secondaryAction,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await widgetTester.tap(find.widgetWithText(ElevatedButton, testButton));
      await widgetTester.pumpAndSettle();
    }

    setUpAll(() {
      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
      registerFallbackValue(FakeDialogRoute<bool>());
    });

    testWidgets('is pushed on router', (widgetTester) async {
      final mockObserver = MockNavigatorObserver();

      await buildTester(widgetTester, mockObserver: mockObserver);

      verify(() => mockObserver.didPush(any<DialogRoute>(), any()));
    });

    testWidgets('executes primary action', (widgetTester) async {
      bool primary = false;

      await buildTester(
        widgetTester,
        primaryAction: (context) => primary = !primary,
      );

      await widgetTester.tap(
        find.widgetWithText(DigitElevatedButton, primaryActionLabel),
      );

      expect(primary, true);
    });

    testWidgets('executes secondary action', (widgetTester) async {
      bool secondary = false;

      await buildTester(
        widgetTester,
        secondaryAction: (context) => secondary = !secondary,
      );

      await widgetTester.tap(
        find.widgetWithText(TextButton, secondaryActionLabel),
      );

      expect(secondary, true);
    });

    testWidgets('has UI components', (widgetTester) async {
      await buildTester(
        widgetTester,
        primaryAction: (context) {},
        secondaryAction: (context) {},
      );

      expect(find.text(alertTitle), findsOneWidget);
      expect(find.text(content), findsOneWidget);

      expect(
        find.widgetWithText(DigitElevatedButton, primaryActionLabel),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(TextButton, secondaryActionLabel),
        findsOneWidget,
      );
    });

    testWidgets('context builder renders dialog', (widgetTester) async {
      final mockObserver = MockNavigatorObserver();
      bool primary = false;

      await widgetTester.pumpWidget(
        WidgetApp(
          navigatorObserver: mockObserver,
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => DigitDialog.show<bool>(
                context,
                options: DigitDialogOptions(
                  titleText: alertTitle,
                  contentText: content,
                  primaryAction: DigitDialogActions(
                    label: primaryActionLabel,
                    action: (context) => Navigator.of(context).pop(!primary),
                  ),
                ),
              ).then((value) {
                if (value == null) return;
                primary = value;
              }),
              child: const Text(testButton),
            ),
          ),
        ),
      );

      await widgetTester.tap(find.widgetWithText(ElevatedButton, testButton));
      await widgetTester.pumpAndSettle();

      verify(() => mockObserver.didPush(any<DialogRoute<bool>>(), any()));

      await widgetTester.tap(
        find.widgetWithText(DigitElevatedButton, primaryActionLabel),
      );
      expect(primary, true);
    });
  });
}
