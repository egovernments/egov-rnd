import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../widgets/login/lang_select_card.dart';

class LoginLangSelectPage extends StatelessWidget {
  const LoginLangSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // ! add the background image

      body: Column(
        children: [
          Spacer(),
          LangSelectCard(),
          PoweredByDigit(isWhiteLogo: true),
        ],
      ),
    );
  }
}
