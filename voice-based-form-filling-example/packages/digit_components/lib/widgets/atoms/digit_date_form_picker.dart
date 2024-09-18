
/*

  This is the Updated DigitDateFormPicker with enable voice command with BLoC pattern 

*/

import 'package:digit_components/widgets/atoms/bloc/digit_date_form_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:digit_components/digit_components.dart';


class DigitDateFormPicker extends StatefulWidget {
  final String label;
  final bool isRequired;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final ValueChanged<DateTime?>? onChangeOfDate;
  final String formControlName;
  final bool isEnabled;
  final bool enableVoice;
  final String? requiredMessage;
  final String? Function(DateTime?)? validator;
  final AutovalidateMode? autoValidation;
  final Map<String, String Function(Object control)>? validationMessages;
  final EdgeInsets? margin;
  final DateTime? start;
  final DateTime? end;
  final String? hint;
  final IconData? icon;
  final String? tooltipMessage;
  final EdgeInsets? padding;
  final String cancelText;
  final String confirmText;
  final String? fieldHintText;
  final void Function(FormControl<dynamic>)? onChangeOfFormControl;

  const DigitDateFormPicker({
    super.key,
    required this.label,
    this.isRequired = false,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.onChangeOfDate,
    required this.formControlName,
    this.isEnabled = true,
    this.enableVoice = false,
    this.requiredMessage,
    this.validator,
    this.validationMessages,
    this.autoValidation,
    this.margin,
    this.end,
    this.start,
    this.hint,
    this.tooltipMessage,
    this.icon,
    this.padding,
    required this.cancelText,
    required this.confirmText,
    this.fieldHintText,
    this.onChangeOfFormControl,
  });

  @override
  State<DigitDateFormPicker> createState() => _DigitDateFormPickerState();
}

class _DigitDateFormPickerState extends State<DigitDateFormPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DatePickerBloc(),
      child: LabeledField(
        label: '${widget.label} ${widget.isRequired ? '*' : ''}',
        padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        icon: widget.icon,
        tooltipMessage: widget.tooltipMessage,
        child: ReactiveDatePicker(
          formControlName: widget.formControlName,
          firstDate: widget.start ?? DateTime(1900),
          lastDate: widget.end ?? DateTime.now(),
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
          fieldHintText: widget.fieldHintText,
          builder: (context, picker, child) {
            return BlocListener<DatePickerBloc, DatePickerState>(
              listener: (context, state) {
                if (state is DatePickerDateUpdated) {
                  // Update the form control with the parsed date
                  final form = ReactiveForm.of(context) as FormGroup?;
                  if (form != null) {
                    final control = form.control(widget.formControlName) as FormControl<DateTime>;
                    control.value = state.date;
                  }
                }
              },
              child: Container(
                color: !widget.isEnabled ? const DigitColors().seaShellGray : null,
                child: ReactiveTextField(
                  style: TextStyle(
                    color: widget.isEnabled
                        ? DigitTheme.instance.colorScheme.onBackground
                        : DigitTheme.instance.colorScheme.shadow,
                  ),
                  formControlName: widget.formControlName,
                  validationMessages: widget.validationMessages,
                  readOnly: true,
                  valueAccessor: DateTimeValueAccessor(
                    dateTimeFormat: DateFormat('dd MMM yyyy'),
                  ),
                  decoration: widget.isEnabled
                      ? InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.enableVoice)
                                IconButton(
                                  icon: const Icon(Icons.mic, size: 25),
                                  onPressed: widget.isEnabled
                                      ? () => _toggleListening(context)
                                      : null,
                                ),
                              const Icon(
                                Icons.date_range,
                                size: 25,
                              ),
                            ],
                          ),
                          label: widget.hint == null ? null : Text(widget.hint!),
                        )
                      : InputDecoration(
                          enabledBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          fillColor: DigitTheme.instance.colors.cloudGray,
                          focusedBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          focusColor: DigitTheme.instance.colors.cloudGray,
                          suffixIcon: const Icon(
                            Icons.date_range,
                            size: 25,
                          ),
                        ),
                  enableInteractiveSelection: widget.isEnabled,
                  onTap: widget.isEnabled == true
                      ? (control) {
                          picker.showPicker();
                        }
                      : null,
                  onChanged: widget.onChangeOfFormControl,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _toggleListening(BuildContext context) {
    final dateBloc = context.read<DatePickerBloc>();
    if (dateBloc.state is DatePickerListening) {
      dateBloc.add(StopListeningEvent());
    } else {
      dateBloc.add(StartListeningEvent());
    }
  }
}






// old code 


// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class DigitDateFormPicker extends StatelessWidget {
//   final String label;
//   final bool isRequired;
//   final DateTime? firstDate;
//   final DateTime? lastDate;
//   final DateTime? initialDate;

//   final ValueChanged<DateTime?>? onChangeOfDate;
//   final String formControlName;
//   final bool isEnabled;
//   final String? requiredMessage;
//   final String? Function(DateTime?)? validator;
//   final AutovalidateMode? autoValidation;
//   final Map<String, String Function(Object control)>? validationMessages;
//   final EdgeInsets? margin;
//   final DateTime? start;
//   final DateTime? end;
//   final String? hint;
//   final IconData? icon;
//   final String? tooltipMessage;
//   final EdgeInsets? padding;
//   final String cancelText;
//   final String confirmText;
//   final String? fieldHintText;
//   final void Function(FormControl<dynamic>)? onChangeOfFormControl;

//   const DigitDateFormPicker({
//     super.key,
//     required this.label,
//     this.isRequired = false,
//     this.firstDate,
//     this.lastDate,
//     this.initialDate,
//     this.onChangeOfDate,
//     required this.formControlName,
//     this.isEnabled = true,
//     this.requiredMessage,
//     this.validator,
//     this.validationMessages,
//     this.autoValidation,
//     this.margin,
//     this.end,
//     this.start,
//     this.hint,
//     this.tooltipMessage,
//     this.icon,
//     this.padding,
//     required this.cancelText,
//     required this.confirmText,
//     this.fieldHintText,
//     this.onChangeOfFormControl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LabeledField(
//       label: '$label ${isRequired ? '*' : ''}',
//       padding: padding ?? const EdgeInsets.only(top: kPadding * 2),
//       labelStyle: Theme.of(context).textTheme.bodyLarge,
//       icon: icon,
//       tooltipMessage: tooltipMessage,
//       child: ReactiveDatePicker(
//         formControlName: formControlName,
//         firstDate: start ?? DateTime(1900),
//         lastDate: end ?? DateTime.now(),
//         cancelText: cancelText,
//         confirmText: confirmText,
//         fieldHintText: fieldHintText,
//         builder: (context, picker, child) {
//           return Container(
//             color: !isEnabled ? const DigitColors().seaShellGray : null,
//             child: ReactiveTextField(
//               style: TextStyle(
//                 color: isEnabled == true
//                     ? DigitTheme.instance.colorScheme.onBackground
//                     : DigitTheme.instance.colorScheme.shadow,
//               ),
//               formControlName: formControlName,
//               validationMessages: validationMessages,
//               readOnly: true,
//               valueAccessor: DateTimeValueAccessor(
//                 dateTimeFormat: DateFormat('dd MMM yyyy'),
//               ),
//               decoration: isEnabled
//                   ? InputDecoration(
//                       contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
//                       suffixIcon: const Icon(
//                         Icons.date_range,
//                         size: 25,
//                       ),
//                       label: hint == null ? null : Text(hint!),
//                     )
//                   : InputDecoration(
//                       enabledBorder: DigitTheme
//                           .instance.inputDecorationTheme.disabledBorder,
//                       fillColor: DigitTheme.instance.colors.cloudGray,
//                       focusedBorder: DigitTheme
//                           .instance.inputDecorationTheme.disabledBorder,
//                       focusColor: DigitTheme.instance.colors.cloudGray,
//                       suffixIcon: const Icon(
//                         Icons.date_range,
//                         size: 25,
//                       ),
//                     ),
//               enableInteractiveSelection: isEnabled,
//               onTap: isEnabled == true
//                   ? (control) {
//                       picker.showPicker();
//                     }
//                   : null,
//               onChanged: onChangeOfFormControl,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

