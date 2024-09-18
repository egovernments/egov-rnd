
/*

This file demonstrates how to use the DigitIntegerFormPicker widget in a form.

*/



import 'package:digit_components/widgets/atoms/bloc/digit_integer_form_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_integer_form_picker.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DigitIntegerFormScreen extends StatelessWidget {
  DigitIntegerFormScreen({Key? key}) : super(key: key);

  // Define the form group
  final FormGroup form = FormGroup({
    'counter': FormControl<int>(value: 0), // Initial value of the picker
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digit Integer Form Picker Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            children: [
              BlocProvider(
                create: (context) => DigitIntegerFormBloc(),
                child: DigitIntegerFormPicker(
                  voiceEnable: true,
                  form: form,
                  formControlName: 'counter',
                  label: 'Select a Number',
                  hint: 'Enter a number',
                  incrementer: true, // Enable incrementer
                  minimum: 0, // Minimum value
                  maximum: 10, // Maximum value
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Display the form value when submitted
                  final value = form.control('counter').value;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected value: $value')),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
