

/*

  this is the demo screen code for implementation of digit date form picker

*/

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_date_form_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';


class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({Key? key}) : super(key: key);

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  final form = FormGroup({
    'date': FormControl<DateTime>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digit Date Form Picker Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) => DatePickerBloc(),
                child: DigitDateFormPicker(
                  label: 'Select Date',
                  formControlName: 'date',
                  cancelText: 'Cancel',
                  confirmText: 'Confirm',
                  enableVoice: true,
                  start: DateTime(1900),
                  end: DateTime.now(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (form.valid) {
                    final selectedDate = form.control('date').value;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Selected Date: $selectedDate'),
                      ),
                    );
                  } else {
                    form.markAllAsTouched();
                  }
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
