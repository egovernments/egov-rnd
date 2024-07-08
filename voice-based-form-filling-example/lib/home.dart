/*



               This is an example app that demonstrates how a form can be filled using voice commands.
 */

// The app has three fields: Name, Phone Number, and Email. The user can fill these fields by speaking into the microphone.
// The app uses the speech_to_text package to convert speech to text and the flutter_tts package to convert text to speech.
// The app also uses the DigitTextField widget from the digit_components package to create the form fields.
// The app listens for voice commands when a field is focused and updates the corresponding field with the recognized text.
// The app also speaks the label of the focused field to guide the user on what to say.
// The app uses the Form widget to validate the form fields and show a snackbar when the form is successfully submitted.
// The app uses the IconButton widget to start and stop listening for voice commands.
// The app uses the FocusNode widget to track which field is currently focused.
// The app uses the ScaffoldMessenger widget to show a snackbar when the form is successfully submitted.
// The app uses the FlutterTts widget to speak the label of the focused field.

// Links to the packages used in this app:
// [Fluttertts](https://pub.dev/packages/flutter_tts)
// [Speech to text](https://pub.dev/packages/speech_to_text)
// [Digit components](https://pub.dev/packages/digit_components)

// The app uses the stt.SpeechToText widget to listen for voice commands and update the form fields with the recognized text.
// The app uses the GlobalKey widget to access the form state and validate the form fields.
// The app uses the TextEditingController widget to control the text input of the form fields.
// The app uses the Scaffold widget to create the app bar and body of the app.
// The app uses the Padding widget to add padding around the form fields.
// The app uses the SingleChildScrollView widget to make the form scrollable when the keyboard is open.

import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:reactive_forms/reactive_forms.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'phone': FormControl<String>(
      validators: [Validators.required],
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'bloodGroup': FormControl<String>(value: 'A+'),
    'agreed': FormControl<bool>(value: false),
  });

  late stt.SpeechToText _speech;
  late FlutterTts flutterTts;

  FocusNode _nameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();

  bool _isListening = false;
  String _currentField = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    flutterTts.stop();
    super.dispose();
  }

  void _submitForm() {
    if (form.valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form successfully submitted')),
      );
      form.reset();
    } else {
      form.markAllAsTouched();
    }
  }

  void _speakLabelText(String labelText) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(labelText);
  }

  void _listen(String field) async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => setState(() {
          _isListening = val == 'listening';
          if (_isListening) {
            _currentField = field;
          } else {
            _currentField = '';
          }
        }),
        onError: (val) => setState(() {
          _isListening = false;
          _currentField = '';
        }),
      );

      if (available) {
        setState(() {
          _currentField = field;
        });

        _speech.listen(onResult: (val) {
          setState(() {
            if (field == 'name' || field == 'phone') {
              form.control(field).value = val.recognizedWords;
            } else if (field == 'email') {
              String recognizedWords = val.recognizedWords;
              if (!recognizedWords.contains('@')) {
                recognizedWords += '@gmail.com';
              }
              form.control(field).value = recognizedWords;
            } else if (field == 'bloodGroup') {
              String recognizedWords = val.recognizedWords.toLowerCase();
              // Matching recognized words to blood group options
              if (recognizedWords.contains('a positive') ||
                  recognizedWords.contains('a plus')) {
                form.control(field).value = 'A+';
              } else if (recognizedWords.contains('a negative') ||
                  recognizedWords.contains('a minus')) {
                form.control(field).value = 'A-';
              } else if (recognizedWords.contains('b positive') ||
                  recognizedWords.contains('b plus')) {
                form.control(field).value = 'B+';
              } else if (recognizedWords.contains('b negative') ||
                  recognizedWords.contains('b minus')) {
                form.control(field).value = 'B-';
              } else if (recognizedWords.contains('o positive') ||
                  recognizedWords.contains('o plus')) {
                form.control(field).value = 'O+';
              } else if (recognizedWords.contains('o negative') ||
                  recognizedWords.contains('o minus')) {
                form.control(field).value = 'O-';
              } else if (recognizedWords.contains('ab positive') ||
                  recognizedWords.contains('ab plus')) {
                form.control(field).value = 'AB+';
              } else if (recognizedWords.contains('ab negative') ||
                  recognizedWords.contains('ab minus')) {
                form.control(field).value = 'AB-';
              }
            } else if (field == 'agreed') {
              String recognizedWords = val.recognizedWords.toLowerCase();
              if (recognizedWords.contains('agree') ||
                  recognizedWords.contains('yes')) {
                form.control(field).value = true;
              } else if (recognizedWords.contains('disagree') ||
                  recognizedWords.contains('no')) {
                form.control(field).value = false;
              }
            }
          });
        });

        await flutterTts.setLanguage('en-US');
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
      flutterTts.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 9, 9),
        centerTitle: true,
        title: const Text('Digit Test Form App',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: this.form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Row(
                //   children: [
                //     Expanded(
                //       child: Focus(
                //         onFocusChange: (hasFocus) {
                //           if (hasFocus) {
                //             _speakLabelText('Name');
                //           }
                //         },

                //         child: DigitTextFormField(
                //           formControlName: 'name',
                //           label: 'Name',
                //           focusNode: _nameFocus,
                //           validationMessages: {
                //             'required': (_) => 'Please enter your name',
                //           },
                //         ),
                //       ),
                //     ),
                //     IconButton(
                //       icon: Icon(_isListening && _currentField == 'name'
                //           ? Icons.mic
                //           : Icons.mic_none),
                //       onPressed: () => _listen('name'),
                //     ),
                //   ],
                // ),

                // Modified DigitTextFormField to include enableVoiceCommand property inclusively
                // instead of using FocusNode and IconButton to listen for voice commands
                Row(
                  children: [
                    Expanded(
                      child: DigitTextFormField(
                        formControlName: 'name',
                        label: 'Name',
                        enableVoiceCommand: true,
                        validationMessages: {
                          'required': (_) => 'Please enter your name',
                        },
                      ),
                    ),
                  ],
                ),

                // Row(
                //   children: [
                //     Expanded(
                //       child: Focus(
                //         onFocusChange: (hasFocus) {
                //           if (hasFocus) {
                //             _speakLabelText('Phone Number');
                //           }
                //         },
                //         child: DigitTextFormField(
                //           formControlName: 'phone',
                //           label: 'Phone Number',
                //           focusNode: _phoneFocus,
                //           validationMessages: {
                //             'required': (_) => 'Please enter your phone number',
                //           },
                //         ),
                //       ),
                //     ),
                //     IconButton(
                //       icon: Icon(_isListening && _currentField == 'phone'
                //           ? Icons.mic
                //           : Icons.mic_none),
                //       onPressed: () => _listen('phone'),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                      child: DigitTextFormField(
                        formControlName: 'phone',
                        label: 'Phone Number',
                        enableVoiceCommand: true,
                        validationMessages: {
                          'required': (_) => 'Please enter your phone number',
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            _speakLabelText('Email');
                          }
                        },
                        child: DigitTextFormField(
                          formControlName: 'email',
                          label: 'Email',
                          focusNode: _emailFocus,
                          validationMessages: {
                            'required': (_) => 'Please enter your email',
                            'email': (_) => 'Invalid email format',
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isListening && _currentField == 'email'
                          ? Icons.mic
                          : Icons.mic_none),
                      onPressed: () => _listen('email'),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: DigitTextFormField(
                //         formControlName: 'email',
                //         label: 'Email',
                //         enableVoiceCommand: true,
                //         validationMessages: {
                //           'required': (_) => 'Please enter your name',
                //           'email': (_) => 'Invalid email format',
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      const Text('Blood Group:'),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DigitReactiveDropdown<String>(
                          label: 'Blood Group',
                          menuItems: const [
                            'A+',
                            'A-',
                            'B+',
                            'B-',
                            'O+',
                            'O-',
                            'AB+',
                            'AB-',
                          ],
                          isRequired: true,
                          formControlName: 'bloodGroup',
                          valueMapper: (value) => value,
                          onChanged: (value) {
                            form.control('bloodGroup').value = value;
                          },
                          validationMessages: {
                            'required': (_) => 'Please select your blood group',
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isListening && _currentField == 'bloodGroup'
                            ? Icons.mic
                            : Icons.mic_none),
                        onPressed: () => _listen('bloodGroup'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DigitCheckbox(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          label: 'I agree to the terms and conditions',
                          onChanged: (value) {
                            form.control('agreed').value = value;
                          },
                          value:
                              (form.control('agreed').value ?? false) as bool,
                        ),

                        // child: DigitCheckboxTile(
                        //   margin: const EdgeInsets.only(top: 16),
                        //   padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        //   label: 'I agree to the terms and conditions',
                        //   value: (form.control('agreed').value ?? false) as bool,
                        //   onChanged: (value) {
                        //     form.control('agreed').value = value;
                        //   },
                        // ),
                      ),
                      IconButton(
                        icon: Icon(_isListening && _currentField == 'agreed'
                            ? Icons.mic
                            : Icons.mic_none),
                        onPressed: () => _listen('agreed'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DigitOutLineButton(
                    label: 'Submit',
                    onPressed: _submitForm,
                  ),
                  //child : Button(label:'Submit', onPressed:_submitForm, type: ButtonType.primary, )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
