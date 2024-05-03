import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  DigitUi.instance.initThemeComponents();

  group('Digit theme', () {
    group('Typography', () {
      final digitTheme = DigitTheme.instance;

      final widget = MaterialApp(
        theme: digitTheme.mobileTheme,
        home: Scaffold(
          body: Builder(builder: (context) {
            final theme = Theme.of(context).textTheme;
            return Column(
              children: [
                Text('Headline XL', style: theme.displayMedium),
                Text('Headline L', style: theme.headlineLarge),
                Text('Headline M', style: theme.headlineMedium),
                Text('Headline S', style: theme.headlineSmall),
                Text('Caption XL', style: theme.labelLarge),
                Text('Caption L', style: theme.labelMedium),
                Text('Caption M', style: theme.labelSmall),
                Text('Body L', style: theme.bodyLarge),
                Text('Body S', style: theme.bodyMedium),
                Text('Body XS', style: theme.bodySmall),
                Text('Label', style: digitTheme.mobileTypography.label),
                Text('Link', style: digitTheme.mobileTypography.link),
              ],
            );
          }),
        ),
      );

      const normal = Color(0xFF0B0C0C);
      const light = Color(0xFF505A5F);

      const designSpecifications = [
        _DesignSpecification(
          title: 'Headline XL',
          fontSize: 32,
          color: normal,
          fontWeight: FontWeight.w700,
        ),
        _DesignSpecification(
          title: 'Headline L',
          fontSize: 24,
          color: normal,
          fontWeight: FontWeight.w700,
        ),
        _DesignSpecification(
          title: 'Headline M',
          fontSize: 18,
          color: normal,
          fontWeight: FontWeight.w700,
        ),
        _DesignSpecification(
          title: 'Body L',
          fontSize: 16,
          color: normal,
          fontWeight: FontWeight.w400,
        ),
        _DesignSpecification(
          title: 'Body S',
          fontSize: 14,
          color: normal,
          fontWeight: FontWeight.w400,
        ),
        _DesignSpecification(
          title: 'Caption XL',
          fontSize: 19,
          color: normal,
          fontWeight: FontWeight.w500,
        ),
        _DesignSpecification(
          title: 'Caption L',
          fontSize: 18,
          color: light,
          fontWeight: FontWeight.w400,
        ),
        _DesignSpecification(
          title: 'Caption M',
          fontSize: 16,
          color: light,
          fontWeight: FontWeight.w400,
        ),
        _DesignSpecification(
          title: 'Link',
          fontSize: 16,
          color: normal,
          fontWeight: FontWeight.w400,
        ),
        _DesignSpecification(
          title: 'Label',
          fontSize: 16,
          color: normal,
          fontWeight: FontWeight.w400,
        ),
      ];

      for (final element in designSpecifications) {
        group(element.title, () {
          testWidgets('matches title', (tester) async {
            await tester.pumpWidget(widget);
            final child = find.text(element.title);
            expect(child, findsOneWidget);
          });

          testWidgets('matches font size', (tester) async {
            await tester.pumpWidget(widget);
            final child = find.text(element.title);
            final textWidget = tester.firstWidget(child) as Text;
            expect(textWidget.style?.fontSize, element.fontSize);
          });

          testWidgets('matches font weight', (tester) async {
            await tester.pumpWidget(widget);
            final child = find.text(element.title);
            final textWidget = tester.firstWidget(child) as Text;
            expect(textWidget.style?.fontWeight, element.fontWeight);
          });

          testWidgets('matches font color', (tester) async {
            await tester.pumpWidget(widget);
            final child = find.text(element.title);
            final textWidget = tester.firstWidget(child) as Text;
            expect(textWidget.style?.color, element.color);
          });
        });
      }
    });
  });
}

class _DesignSpecification {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const _DesignSpecification({
    required this.title,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  });
}
