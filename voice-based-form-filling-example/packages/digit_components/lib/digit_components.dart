library digit_components;

// import 'package:google_fonts/google_fonts.dart';

export 'blocs/location/location.dart';
export 'theme/theme.dart';
export 'widgets/widgets.dart';
export 'utils/app_logger.dart';

class DigitUi {
  static const DigitUi _instance = DigitUi._internal();
  static DigitUi get instance => _instance;

  const DigitUi._internal();

  Future<void> initThemeComponents() async {
    // GoogleFonts.config.allowRuntimeFetching = false;
  }
}
