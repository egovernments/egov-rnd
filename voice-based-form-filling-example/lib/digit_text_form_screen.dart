

/*
  In this file, we are using the DigitTextFormField with voice command feature.
  We are using the DigitTextFormBloc to handle the voice command feature.
  The DigitTextFormBloc is responsible for listening to the voice command and updating the form field value.
  The DigitTextFormField is used to display the form field with voice command feature.

  Also this is a test file to check the voice command feature with the DigitTextFormField.

*/


import 'package:digit_components/widgets/atoms/bloc/digit_text_form_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';



class DigitTextScreen extends StatelessWidget {
  // Defining the form group
  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digit Text Form Field with Voice Command'),
      ),
      body: BlocProvider(
        create: (_) => DigitTextFormBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                // Using DigitTextFormField with voice command
                const DigitTextFormField(
                  label: 'Name',
                  formControlName: 'name',
                  enableVoiceCommand: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (form.valid) {
                      print("Form value: ${form.value['name']}");
                    } else {
                      print("Form is not valid");
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
