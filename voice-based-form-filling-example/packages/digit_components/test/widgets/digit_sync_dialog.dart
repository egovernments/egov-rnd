import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'widget_app.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  group('Digit Sync Dialog - InProgress', () {
    const syncInProgressTitleText = 'Sync In Progress';
    const testButton = 'Test Button';

    Future<void> buildTester(
      WidgetTester widgetTester, {
      MockNavigatorObserver? mockObserver,
    }) async {
      await widgetTester.pumpWidget(
        WidgetApp(
          navigatorObserver: mockObserver,
          child: Builder(
            builder: (context) => ElevatedButton(
              child: const Text(testButton),
              onPressed: () {
                DigitSyncDialog.show(
                  context,
                  type: DigitSyncDialogType.inProgress,
                  label: syncInProgressTitleText,
                );
              },
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

    testWidgets('has UI components', (widgetTester) async {
      await buildTester(
        widgetTester,
      );
      expect(find.text(syncInProgressTitleText), findsOneWidget);
      expect(find.byIcon(Icons.autorenew), findsOneWidget);
    });
  });

  group('Digit Sync Dialog - SyncComplete', () {
    const syncCompleteTitleText = 'Sync Completed';
    const testButton = 'Test Button';
    const syncCompleteButtonText = 'Close';
    Future<void> buildTester(
      WidgetTester widgetTester, {
      MockNavigatorObserver? mockObserver,
    }) async {
      await widgetTester.pumpWidget(WidgetApp(
        navigatorObserver: mockObserver,
        child: Builder(
            builder: (context) => ElevatedButton(
                  child: const Text(testButton),
                  onPressed: () {
                    DigitSyncDialog.show(
                      context,
                      type: DigitSyncDialogType.complete,
                      label: syncCompleteTitleText,
                      primaryAction: DigitDialogActions(
                        label: syncCompleteButtonText,
                        action: (_) {},
                      ),
                    );
                  },
                )),
      ));

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

    testWidgets('has required UI components', (widgetTester) async {
      await buildTester(
        widgetTester,
      );
      expect(find.text(syncCompleteTitleText), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
      expect(find.byType(DigitElevatedButton), findsOneWidget);
      expect(find.text(syncCompleteButtonText), findsOneWidget);
    });
  });

  group('Digit Sync Dialog - SyncFailed', () {
    const syncFailedTitleText = 'Sync Failed';
    const retryButtonText = 'Retry';
    const dismissButtonText = 'Dismiss';
    const testButton = 'Test Button';

    Future<void> buildTester(
      WidgetTester widgetTester, {
      MockNavigatorObserver? mockObserver,
    }) async {
      await widgetTester.pumpWidget(
        WidgetApp(
          navigatorObserver: mockObserver,
          child: Builder(
            builder: (context) => ElevatedButton(
              child: const Text(testButton),
              onPressed: () {
                DigitSyncDialog.show(
                  context,
                  type: DigitSyncDialogType.failed,
                  label: syncFailedTitleText,
                  primaryAction: DigitDialogActions(
                    label: retryButtonText,
                    action: (_) {},
                  ),
                  secondaryAction: DigitDialogActions(
                    label: dismissButtonText,
                    action: (_) {},
                  ),
                );
              },
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

    testWidgets('has required UI components', (widgetTester) async {
      await buildTester(
        widgetTester,
      );
      expect(find.text(syncFailedTitleText), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
      expect(find.byType(DigitElevatedButton), findsOneWidget);
      expect(find.text(retryButtonText), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text(dismissButtonText), findsOneWidget);
    });
  });
}
