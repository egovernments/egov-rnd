library digit_theme;

import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/typography.dart';
import 'package:flutter/material.dart';

const kPadding = 8.0;

class DigitTheme {
  static const DigitTheme _instance = DigitTheme._internal();

  static DigitTheme get instance => _instance;

  DigitColors get colors => const DigitColors();

  DigitMobileTypography get mobileTypography => DigitMobileTypography(
        normalBase: const TextStyle(
          fontFamily: 'Roboto',
        ),
        displayBase: const TextStyle(
          fontFamily: 'Roboto',
        ),
        light: colors.davyGray,
        normal: colors.woodsmokeBlack,
      );

  const DigitTheme._internal();

  ThemeData get mobileTheme {
    const Border(top: BorderSide());

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: false,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: mobileTypography.textTheme,
      appBarTheme: const AppBarTheme(elevation: 0),
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      cardTheme: cardTheme,
      inputDecorationTheme: inputDecorationTheme,
      dialogTheme: dialogTheme,
    );
  }

  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: colors.regalBlue,
        onPrimary: colors.white,
        secondary: colors.burningOrange,
        onSecondary: colors.white,
        error: colors.lavaRed,
        onError: colors.white,
        background: colors.seaShellGray,
        onBackground: colors.woodsmokeBlack,
        surface: colors.alabasterWhite,
        onSurface: colors.woodsmokeBlack,
        onSurfaceVariant: colors.darkSpringGreen,
        tertiaryContainer: colors.tropicalBlue,
        inversePrimary: colors.paleLeafGreen,
        surfaceTint: colors.waterBlue,
        outline: colors.quillGray,
        shadow: colors.davyGray,
        tertiary: colors.paleRose,
        onTertiaryContainer: colors.curiousBlue,
      );

  EdgeInsets get buttonPadding => const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding * 2,
      );

  EdgeInsets get containerMargin => const EdgeInsets.all(kPadding);

  EdgeInsets get verticalMargin => const EdgeInsets.symmetric(
        vertical: kPadding,
      );

  Duration get toastDuration => const Duration(seconds: 2);

  OutlinedBorder get buttonBorder => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          disabledBackgroundColor: colorScheme.secondary.withOpacity(
            0.5,
          ),
          disabledForegroundColor: colorScheme.onSecondary,
          elevation: 0,
        ),
      );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.secondary,
          side: BorderSide(color: colorScheme.secondary),
          padding: buttonPadding,
        ),
      );

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: buttonBorder,
          padding: buttonPadding,
          textStyle: const TextStyle(fontSize: 16),
          foregroundColor: colorScheme.secondary,
        ),
      );

  CardTheme get cardTheme => const CardTheme(
        margin: EdgeInsets.fromLTRB(kPadding, kPadding * 2, kPadding, 0),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(
            color: colors.davyGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(
            color: colors.burningOrange,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(color: colors.cloudGray, width: 1),
        ),
        contentPadding: const EdgeInsets.all(12),
        isDense: true,
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(
            color: colors.lavaRed,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              0,
            ),
          ),
          borderSide: BorderSide(color: colors.lavaRed, width: 2),
        ),
      );

  DialogTheme get dialogTheme => DialogTheme(
        titleTextStyle: mobileTypography.headingL,
        contentTextStyle: mobileTypography.bodyL,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.all(kPadding),
      );

  BorderSide get tableCellBorder => BorderSide(
        color: colorScheme.outline,
        width: 0.5,
      );

  BorderSide get tableCellStrongBorder => BorderSide(
        color: colorScheme.outline,
        width: 2,
      );
}
