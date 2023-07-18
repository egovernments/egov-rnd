import 'package:get/get.dart';

class AppTranslation extends Translations {

  static String get hello => 'hello';
  static String get bye => 'bye';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': {
          hello: 'Hello World',
          bye: 'Good Bye',
        },
        'hi_IN': {
          hello: 'नमस्ते दुनिया',
          bye: 'अलविदा',
        },
      };
}