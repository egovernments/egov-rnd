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

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  // _formkey is used to access the form state and validate the form fields
  final _formKey = GlobalKey<FormState>();

  // _nameController, _emailController, _phoneController are used to control the text input of the form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // _speech is used to listen for voice commands and update the form fields with the recognized text
  late stt.SpeechToText _speech;
  late FlutterTts flutterTts;


  // here we are creating focus nodes for each field which will help us to know which field is currently focused
  FocusNode _nameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();

  // _isListening is used to track if the app is currently listening for voice commands
  bool _isListening = false;
  //Initializing the current field to an empty string
  String _currentField = '';


  // initState is called when the state object is created and 
  // when initstate is called we are initializing the speech to text object along with flutter tts object
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    flutterTts = FlutterTts();
  }


  // dispose is called when the state object is removed to release resources
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    flutterTts.stop();
    //flutterTts.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form successfully submitted')),
      );
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
    }
  }


  // _speakLabelText is used to speak the label of the focused field to guide the user on what to say
  // here we are setting the language to 'en-US' and speaking the labelText
  // we are using flutter tts to speak the labelText
  // we are using async and await to make the function asynchronous 
  // which will help us to speak the labelText even if the app is busy

  void _speakLabelText(String labelText) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(labelText);
  }


  // _listen is used to listen for voice commands and update the form fields with the recognized text
  // here we are checking if the app is currently listening for voice commands
  // if the app is not listening then we are initializing the speech to text object
  // and checking if the speech to text is available
  // if the speech to text is available then we are setting the current field to the field that is currently focused
  // and listening for voice commands
  // when the voice command is recognized we are updating the corresponding field with the recognized text
  // if the field is 'name' then we are updating the name field with the recognized text
  // if the field is 'phone' then we are updating the phone field with the recognized text
  // if the field is 'email' then we are updating the email field with the recognized text
  // if the app is currently listening for voice commands then we are stopping the speech to text object
  // and setting the current field to an empty string

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
            if (field == 'name') {
              _nameController.text = val.recognizedWords;
            } else if (field == 'phone') {
              _phoneController.text = val.recognizedWords;
            } else if (field == 'email') {
              
              _emailController.text = val.recognizedWords + '@gmail.com';
            }
          });
        });

        await flutterTts.setLanguage('en-US');
      //  await flutterTts.speak('Please say $field');
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
        title: Text('Digit Test Form App' , style: TextStyle(color: Colors.white),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: Form widget is used to validate the form fields and show a snackbar when the form is successfully submitted
        // along with DigitTextField widget to create the form fields
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            _speakLabelText('Name');
                          }
                        },
                        child: DigitTextField(
                          label: 'Name',
                          controller: _nameController,

                          // focusNode is used to track which field is currently focused
                          // here we are setting the focusNode to the nameFocus
                          // _nameFocus is a private variable that is used to track the focus of the name field

                          focusNode: _nameFocus, 
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    IconButton( 

                      // IconButton widget is used to start and stop listening for voice commands
                      // here we are checking if the app is currently listening for voice commands
                      // if the app is listening then we are showing the mic icon
                      // if the app is not listening then we are showing the mic_none icon
                      // when the mic icon is clicked we are calling the _listen function with the field name
                      // which will start listening for voice commands and update the name field with the recognized text

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
                      child: Focus( // Focus widget is used to track the focus of the field

                        // onFocusChange is called when the focus of the field changes
                        // here we are checking if the field is currently focused
                        // if the field is focused then we are speaking the label text
                        // we are calling the _speakLabelText function with the label text 'Phone Number'
                        // which will speak the label text 'Phone Number' when the phone field is focused

                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            _speakLabelText('Phone Number');
                          }
                        },
                        child: DigitTextField(
                          label: 'Phone Number',
                          controller: _phoneController,
                          focusNode: _phoneFocus,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
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
                        child: DigitTextField(
                          label: 'Email',
                          controller: _emailController,
                          focusNode: _emailFocus,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
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
                  // child: ElevatedButton(
                  //   onPressed: _submitForm,
                  //   child: Text('Submit'),
                  // ),
                  child: DigitOutLineButton(label: 'Submit', onPressed: _submitForm, ),
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










// tried talkback but was not effective
// flutter tts was a better option to make it work 








