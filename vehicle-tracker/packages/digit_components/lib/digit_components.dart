library digit_components;

export 'blocs/location/location.dart';
export 'theme/theme.dart';
export 'utils/app_logger.dart';
export 'widgets/widgets.dart';

class DigitUi {
  static const DigitUi _instance = DigitUi._internal();
  static DigitUi get instance => _instance;

  const DigitUi._internal();

  Future<void> initThemeComponents() async {}
}
