/*

  This is the Demo Screen For Showing Working of DigitRadioButtonList 
  integrated with Voice feature along with BLoC

*/

import 'package:digit_components/widgets/atoms/bloc/digit_radio_button_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RadioButtonDemoScreen extends StatefulWidget {
  @override
  _RadioButtonDemoScreenState createState() => _RadioButtonDemoScreenState();
}

class _RadioButtonDemoScreenState extends State<RadioButtonDemoScreen> {
  final FormGroup form = FormGroup({
    'gender': FormControl<String>(validators: [Validators.required]),
  });

 
  final List<String> options = ['Apple', 'Banana', 'Mango' , 'Orange', 'Grapes', 'Pineapple', 'Strawberry', 'Watermelon', 'Kiwi', 'Papaya'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice-Driven Radio Button Demo'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) => DigitRadioButtonListBloc(),
                child: DigitRadioButtonList<String>(
                  enableVoice: true,
                  formControlName: 'gender',
                  labelText: 'Select Gender',
                  isRequired: true,
                  valueMapper: (value) => value.toString(),
                  options: options,
                  onValueChange: (value) {
                    print('Selected Gender: $value');
                  },
                  errorMessage: 'Please select a gender',
                ),
              ),
              const SizedBox(height: 20),
             
              const SizedBox(height: 20),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        final selectedGender = form.control('gender').value;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Selected Gender: $selectedGender')),
                        );
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                    child: const Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
