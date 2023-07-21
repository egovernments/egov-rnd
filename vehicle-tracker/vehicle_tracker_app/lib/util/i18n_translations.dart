import 'package:get/get.dart';

class AppTranslation extends Translations {
  static String get hello => 'hello';
  static String get bye => 'bye';
  static String get home => 'home';
  static String get about => 'about';
  static String get appHeading => 'appHeading';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': {
          hello: 'Hello World',
          bye: 'Good Bye',
          home: 'Home',
          about: 'About',
          appHeading: 'Vehicle Tracker App',
        },
        
        'hi_IN': {
          hello: 'नमस्ते दुनिया',
          bye: 'अलविदा',
          home: 'घर',
          about: 'के बारे में',
          appHeading: 'वाहन ट्रैकर ऐप',
        },
      };
}
