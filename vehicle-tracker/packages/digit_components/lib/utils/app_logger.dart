import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class AppLogger {
  static AppLogger get instance => _instance;
  static const _instance = AppLogger._();

  const AppLogger._();

  void debug(dynamic input, {String? title}) =>
      _printMessage(input, title: title, level: Level.CONFIG);

  void info(dynamic input, {String? title}) =>
      _printMessage(input, title: title, level: Level.INFO);

  void error({
    required String title,
    String? message,
    StackTrace? stackTrace,
  }) =>
      _printError(
        message: message,
        title: title,
        stackTrace: stackTrace,
      );

  void _printError({
    required String title,
    String? message,
    StackTrace? stackTrace,
  }) {
    if (stackTrace != null) {
      debugPrintStack(
        label: title,
        stackTrace: stackTrace,
      );
    } else {
      _printMessage(
        message,
        title: title,
        level: Level.SEVERE,
      );
    }
  }

  void _printMessage(
    dynamic input, {
    String? title,
    required Level level,
  }) =>
      debugPrint(
        [
          '[${level.name.padRight(4, ' ').substring(0, 4)}] ',
          '${(title ?? runtimeType.toString())}\n',
          '${input.toString()}\n',
        ].join(''),
        wrapWidth: 120,
      );
}
