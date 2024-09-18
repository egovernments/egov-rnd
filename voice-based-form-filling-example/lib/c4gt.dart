
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_checkbox_bloc.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_date_form_picker_bloc.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_radio_button_bloc.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_reactive_search_dropdown_bloc.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_text_form_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
class VoiceCommandDemoScreen extends StatefulWidget {
  const VoiceCommandDemoScreen({Key? key}) : super(key: key);

  @override
  _VoiceCommandDemoScreenState createState() => _VoiceCommandDemoScreenState();
}

class _VoiceCommandDemoScreenState extends State<VoiceCommandDemoScreen> {
  final form = FormGroup({
    'checkbox': FormControl<bool>(value: false),
    'date': FormControl<DateTime>(),
    'counter': FormControl<int>(value: 0),
    'gender': FormControl<String>(validators: [Validators.required]),
    'dropdown': FormControl<String>(validators: [Validators.required]),
    'name': FormControl<String>(validators: [Validators.required]),
  });

  final List<String> genderOptions = ['India', 'Bangladesh', 'Africa', 'Burma', 'Portugal'];
  String valueMapper(dynamic value) => value.toString();
  bool _isChecked = false;
  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice-based Exemplar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: ListView(
            children: [
              // Name Field
              
              BlocProvider(
                create: (context) => DigitTextFormBloc(),
                child: DigitTextFormField(
                  label: 'Name',
                  formControlName: 'name',
                  enableVoiceCommand: true,
                ),
              ),
             
              const SizedBox(height: 20),
               const Text('Say the name you want to fill in'),

              // Radio Button (Gender)
             
              BlocProvider(
                create: (context) => DigitRadioButtonListBloc(),
                child: DigitRadioButtonList<String>(
                  enableVoice: true,
                  formControlName: 'gender',
                  labelText: 'Select Country',
                  options: genderOptions,
                  valueMapper: (value) => value.toString(),
                  errorMessage: 'Please select a Country',
                ),
              ),
               const Text('Say the country name to select (e.g., "India", "Bangladesh")'),
              const SizedBox(height: 20),

              // Integer Picker
              
              BlocProvider(
                create: (context) => DatePickerBloc(),
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
              const Text('Say any number in english format (e.g., "twenty five(25)", "seventeen (17)") , " zero eight(8)" to select'),
              const SizedBox(height: 20),

              // Date Picker
              
              BlocProvider(
                create: (context) => DatePickerBloc(),
                child: DigitDateFormPicker(
                  label: 'Select Date',
                  formControlName: 'date',
                  enableVoice: true,
                  start: DateTime(1900),
                  end: DateTime.now(),
                  cancelText: 'Cancel',
                  confirmText: 'Confirm',
                  
                ),
              ),
              const Text('Say a date (e.g., "25 April 2005" in english format ("twenty five april two thousand five")) to select'),
              const SizedBox(height: 20),

              // Dropdown (Fruits)
             
              BlocProvider(
                create: (context) => DigitReactiveSearchDropdownBloc(),
                child: DigitReactiveSearchDropdown(
                  label: 'Select a Fruit',
                  formControlName: 'dropdown',
                  enableVoiceCommand: true,
                  menuItems: const [
                    'Apple',
                    'Banana',
                    'Cherry',
                    'Date',
                    'Elderberry',
                    'Fig',
                    'Grape',
                    'Honeydew',
                  ],
                  valueMapper: valueMapper,
                  validationMessage: 'Please select a fruit',
                  form: form,
                ),
              ),
               const Text('Say the fruit name to select (e.g., "Apple", "Grape" , Cherry)'),
              const SizedBox(height: 20),

              // Checkbox
             // const Text('Say "check" to mark, "uncheck" to unmark'),
              BlocProvider(
                create: (context) => DigitCheckboxBloc(),
                child: DigitCheckbox(
                  enableVoice: true,
                  label: 'Check me!',
                  value: _isChecked,
                  onChanged: _toggleCheckbox,
                  padding: EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (form.valid) {
                  //  final checkbox = form.control('checkbox').value;
                    final date = form.control('date').value;
                    final integer = form.control('counter').value;
                    final gender = form.control('gender').value;
                    final dropdown = form.control('dropdown').value;
                    final name = form.control('name').value;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Submitted:\nName: $name\nGender: $gender\n'
                          'Integer: $integer\nDate: $date\nFruit: $dropdown\n',
                        ),
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
