

/*
This is the main file where we will be adding the voice command feature to the DigitIntegerFormPicker widget.
We will be using the SpeechBloc to handle the voice command feature.
*/


import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_integer_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';



class DigitIntegerFormPicker extends StatefulWidget {
  final int? minimum;
  final int? maximum;
  final bool incrementer;
  final String? hint;
  final String label;
  final FormGroup form;
  final String formControlName;
  final bool voiceEnable; // New bool for voice command feature

  const DigitIntegerFormPicker({
    super.key,
    this.minimum,
    this.maximum,
    required this.incrementer,
    required this.formControlName,
    this.hint,
    required this.form,
    required this.label,
    this.voiceEnable = false, // Default is false
  });

  @override
  State<DigitIntegerFormPicker> createState() => _DigitIntegerFormPickerState();
}

class _DigitIntegerFormPickerState extends State<DigitIntegerFormPicker> {
  late DigitIntegerFormBloc _speechBloc;

  @override
  void initState() {
    super.initState();
    _speechBloc = DigitIntegerFormBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _speechBloc,
      child: BlocListener<DigitIntegerFormBloc, SpeechState>(
        listener: (context, state) {
          if (state is SpeechUpdatedState) {
            print("Updating form control with: ${state.text}");
            int? number = int.tryParse(state.text);
            if (number != null) {
              widget.form.control(widget.formControlName).updateValue(number, emitEvent: true);
            }
          }
        },
        child: LabeledField(
          label: widget.label,
          padding: const EdgeInsets.only(top: kPadding * 2),
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          child: IntrinsicHeight(
            child: Row(
              children: [
                if (widget.incrementer)
                  _buildButton(
                    context,
                    border: Border(
                      left: _borderSide,
                      bottom: _borderSide,
                      top: _borderSide,
                    ),
                    icon: Icons.remove,
                    onPressed: () => widget.minimum != null
                        ? widget.form.control(widget.formControlName).value > widget.minimum ||
                                widget.form.control(widget.formControlName).value == null
                            ? widget.form.control(widget.formControlName).value -= 1
                            : 1
                        : widget.form.control(widget.formControlName).value -= 1,
                  ),
                Expanded(
                  child: ReactiveTextField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    formControlName: widget.formControlName,
                    decoration: InputDecoration(
                      labelText: widget.hint,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                if (widget.incrementer)
                  _buildButton(
                    context,
                    border: Border(
                      right: _borderSide,
                      bottom: _borderSide,
                      top: _borderSide,
                    ),
                    icon: Icons.add,
                    onPressed: () => widget.form.control(widget.formControlName).value += 1,
                  ),
                if (widget.voiceEnable) // Conditionally show mic button if voiceEnable is true
                  BlocBuilder<DigitIntegerFormBloc, SpeechState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding around the mic button
                        child: IconButton(
                          icon: Icon(state is SpeechListeningState ? Icons.mic : Icons.mic_none),
                          onPressed: () {
                            if (state is SpeechListeningState) {
                              _speechBloc.stopListening();
                            } else {
                              _speechBloc.startListening();
                            }
                          },
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required Border border,
    required IconData icon,
    VoidCallback? onPressed,
  }) =>
      AspectRatio(
        aspectRatio: 1,
        child: Material(
          shape: border,
          color: Theme.of(context).colorScheme.background,
          child: InkWell(onTap: onPressed, child: Icon(icon)),
        ),
      );

  BorderSide get _borderSide => const BorderSide(width: 0.8);
}



// old code 


// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class DigitIntegerFormPicker extends StatelessWidget {
//   final int? minimum;
//   final int? maximum;
//   final bool incrementer;
//   final String? hint;
//   final String label;
//   final FormGroup form;
//   final String formControlName;
//   const DigitIntegerFormPicker({
//     super.key,
//     this.minimum,
//     this.maximum,
//     required this.incrementer,
//     required this.formControlName,
//     this.hint,
//     required this.form,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (!incrementer) {
//       return LabeledField(
//           padding: const EdgeInsets.only(top: kPadding * 2),
//           label: label,
//           child: ReactiveTextField(
//             formControlName: formControlName,
//             decoration: InputDecoration(labelText: hint),
//             keyboardType: TextInputType.number,
//           ));
//     }

//     return LabeledField(
//         label: label,
//         padding: const EdgeInsets.only(top: kPadding * 2),
//         labelStyle: Theme.of(context).textTheme.bodyLarge,
//         child: IntrinsicHeight(
//           child: Row(
//             children: [
//               _buildButton(
//                 context,
//                 border: Border(
//                   left: _borderSide,
//                   bottom: _borderSide,
//                   top: _borderSide,
//                 ),
//                 icon: Icons.remove,
//                 onPressed: () => minimum != null
//                     ? form.control(formControlName).value > minimum ||
//                             form.control(formControlName).value == null
//                         ? form.control(formControlName).value -= 1
//                         : 1
//                     : form.control(formControlName).value -= 1,
//               ),
//               Expanded(
//                 child: ReactiveTextField(
//                   readOnly: true,
//                   textAlign: TextAlign.center,
//                   formControlName: formControlName,
//                   decoration: InputDecoration(
//                     labelText: hint,
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//               _buildButton(context,
//                   border: Border(
//                     right: _borderSide,
//                     bottom: _borderSide,
//                     top: _borderSide,
//                   ),
//                   icon: Icons.add,
//                   onPressed: () => form.control(formControlName).value += 1),
//             ],
//           ),
//         ));
//   }

//   Widget _buildButton(
//     BuildContext context, {
//     required Border border,
//     required IconData icon,
//     VoidCallback? onPressed,
//   }) =>
//       AspectRatio(
//         aspectRatio: 1,
//         child: Material(
//           shape: border,
//           color: Theme.of(context).colorScheme.background,
//           child: InkWell(onTap: onPressed, child: Icon(icon)),
//         ),
//       );

//   BorderSide get _borderSide => const BorderSide(width: 0.8);
// }




