import 'package:flutter/material.dart';

abstract class DigitTypography {
  final Color? _textColorNormal;
  final Color? _textColorLight;
  final TextStyle _normalBase;
  final TextStyle _displayBase;

  const DigitTypography({
    required TextStyle normalBase,
    required TextStyle displayBase,
    Color? normal,
    Color? light,
  })  : _normalBase = normalBase,
        _displayBase = displayBase,
        _textColorLight = light,
        _textColorNormal = normal;

  TextStyle get _normal =>
      _normalBase.copyWith(color: _textColorNormal, fontFamily: 'Roboto');
  TextStyle get _light =>
      _normalBase.copyWith(color: _textColorLight, fontFamily: 'Roboto');
  TextStyle get _big => _displayBase.copyWith(
      color: _textColorNormal, fontFamily: 'Roboto Condensed');

  /// Follows Digit Typography standards
  ///
  /// <https://design-egov.github.io/ui-docs/foundations/typography>
  TextTheme get textTheme;

  /// Heading styles
  TextStyle get headingXl => textTheme.displayMedium!;
  TextStyle get headingL => textTheme.headlineLarge!;
  TextStyle get headingM => textTheme.headlineMedium!;
  TextStyle get headingS => textTheme.headlineSmall!;

  /// Caption styles
  TextStyle get captionXL => textTheme.labelLarge!;
  TextStyle get captionL => textTheme.labelMedium!;
  TextStyle get captionM => textTheme.labelSmall!;

  /// Body styles
  TextStyle get bodyL => textTheme.bodyLarge!;
  TextStyle get bodyM => textTheme.bodyMedium!;
  TextStyle get bodyS => textTheme.bodySmall!;

  /// Miscellaneous styles
  TextStyle get label => textTheme.bodyLarge!;
  TextStyle get link => textTheme.bodyLarge!;
}

class DigitMobileTypography extends DigitTypography {
  const DigitMobileTypography({
    required TextStyle normalBase,
    required TextStyle displayBase,
    Color? normal,
    Color? light,
  }) : super(
          normal: normal,
          light: light,
          displayBase: displayBase,
          normalBase: normalBase,
        );

  @override
  TextTheme get textTheme {
    return TextTheme(
      displayMedium: _big.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontFamily: 'RobotoCondensed',
      ),
      headlineLarge: _normal.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: _normal.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: _normal.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
      ),
      bodyLarge: _normal.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      bodyMedium: _normal.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      bodySmall: _normal.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      labelLarge: _normal.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: _light.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      labelSmall: _normal.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
