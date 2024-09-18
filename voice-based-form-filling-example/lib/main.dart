import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:dummy2/c4gt.dart';
import 'package:dummy2/digit_checkbox_screen.dart';
import 'package:dummy2/digit_integer_form_screen.dart';
import 'package:dummy2/digit_radio_button_list_screen.dart';
import 'package:dummy2/digit_search_dropdown_screen.dart';
import 'package:dummy2/digit_text_form_screen.dart';
import 'package:dummy2/home.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/digit_components.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: DigitTheme.instance.mobileTheme,
      debugShowCheckedModeBanner: false,
     // home:  DigitTextScreen(),

     // now for DigitSearchDropDownScreen
    //  home: const DigitSearchDropDownScreen(),

    // now for DigitIntegerFormPicker
   // home: DigitIntegerFormScreen(),

   // now for DigitRadioButton
  //  home: RadioButtonDemoScreen()
  //  home : DigitCheckboxTestScreen()
  home : VoiceCommandDemoScreen()
    );
  }
  
}


// code up for the PR from voice_based_digit_lib  to voice_based_form_filling_patch_1
