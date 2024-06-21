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




import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:digit_components/digit_components.dart';
import 'package:reactive_forms/reactive_forms.dart';


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  // form is used to access the form state and validate the form fields
  // Using Reactive form with DigitTextFormField 

  // Shifted DigitTextField ----> DigitTextFormField 

  // FormGroup basically is a group of form controls that enables you to 
  //track the value and validation state of the form controls in a single place.

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
  });

  late stt.SpeechToText _speech;
  late FlutterTts flutterTts;

  FocusNode _nameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();

  bool _isListening = false;
  String _currentField = '';

  @override

  // initState is called when the state object is created and 
  // when initstate is called we are initializing the speech to text object along with flutter tts object
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    // disposing the controllers and focus nodes to ensure no memory leaks
    // memory leaks can cause the app to slow down and crash and it may leads to performance issues

    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    flutterTts.stop();
    super.dispose();
  }


  // _submitForm is used to submit the form
  // here we are checking if the form is valid
  // if the form is valid then we are showing a snackbar with the message 'Form successfully submitted'
  // and resetting the form
  // if the form is not valid then we are marking all the fields as touched
  // which will show the validation error messages for the fields that are not valid
  
  void _submitForm() {
    if (form.valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form successfully submitted')),
      );
      form.reset();
    } else {
      form.markAllAsTouched();
    }
  }

  //  _speakLabelText is used to speak the label of the focused field to guide the user on what to say
  // here we are setting the language to 'en-US' and speaking the labelText
  // we are using flutter tts to speak the labelText
  // we are using async and await to make the function asynchronous 
  // which will help us to speak the labelText even if the app is busy

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
          // here we are using setstate to update the isListening and currentField variables
          // if the app is currently listening for voice commands then we are stopping the speech to text object
          _isListening = false;
          _currentField = '';
        }),
      );

      if (available) { 

        // if the speech to text is available then we are setting the current \
        //field to the field that is currently focused
        setState(() {
          _currentField = field;
        });

        _speech.listen(onResult: (val) {
          setState(() {
            if (field == 'name') {
              form.control(field).value = val.recognizedWords;
            } else if (field == 'phone') {
              form.control(field).value = val.recognizedWords;
            } else if (field == 'email') {
              String recognizedWords = val.recognizedWords;
              if (!recognizedWords.contains('@')) {
                recognizedWords += '@gmail.com';
              }
              form.control(field).value = recognizedWords;
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
        title: Text('Digit Test Form App', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: this.form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Focus(
                        // onFocusChange is called when the focus of the field changes
                        // here we are checking if the field is currently focused
                        // if the field is focused then we are speaking the label text
                        // we are calling the _speakLabelText function with the label text 'Name'
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            _speakLabelText('Name');
                          }
                        },
                        child: DigitTextFormField(
                          formControlName: 'name', 
                          // formcontrolname is used to bind the form field to the form control
                          // here we are binding the name field to the name form control

                          label: 'Name',
                          focusNode: _nameFocus,
                          validationMessages: {
                            'required': (_) => 'Please enter your name',
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isListening && _currentField == 'name'
                          ? Icons.mic
                          : Icons.mic_none),
                      onPressed: () => _listen('name'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            _speakLabelText('Phone Number');
                          }
                        },
                        child: DigitTextFormField(
                          formControlName: 'phone',
                          label: 'Phone Number',
                          focusNode: _phoneFocus,
                          validationMessages: {
                            'required': (_) => 'Please enter your phone number',
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isListening && _currentField == 'phone'
                          ? Icons.mic
                          : Icons.mic_none),
                      onPressed: () => _listen('phone'),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DigitOutLineButton(
                    label: 'Submit',
                    onPressed: _submitForm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// Code Timeline 


// started with the basic form
// added the speech to text package
// earlier tried to use the talkback but was not effective so used the flutter tts package
// flutter tts showed better results due to its flexibility
// added the digit components package
// added the form fields
// added the focus nodes
// added the speak label text function
// added the listen function
// added the submit form function


// added the reactive form to the form
// added the form control name to the form fields
// added the validation messages to the form fields
// added the form reset function to reset the form after submission
// added the mark all as touched function to show the validation error messages for the fields that are not valid
// added the reactive form widget to the scaffold widget
// shiftef DigitTextField to DigitTextFormField










// tried talkback but was not effective
// flutter tts was a better option to make it work 



