import 'package:digit_components/widgets/atoms/checkbox_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/digit_checkbox_bloc.dart';

class DigitCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsetsGeometry padding;
  final bool enableVoice;

  const DigitCheckbox({
    super.key,
    required this.label,
    this.onChanged,
    this.value = false,
    this.padding = const EdgeInsets.only(left: 4.0),
    this.enableVoice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<DigitCheckboxBloc, DigitCheckboxState>(
            builder: (context, state) {
              bool isChecked = value; // Use the initial checkbox value

              // Update the checkbox state based on the BLoC's state
              if (state == DigitCheckboxState.checked) {
                isChecked = true;
              } else if (state == DigitCheckboxState.unchecked) {
                isChecked = false;
              }

              return InkWell(
                onTap: () {
                  // Toggle checkbox manually
                  onChanged?.call(!isChecked);

                  if (enableVoice) {
                    // Update BLoC state when manually toggling
                    if (isChecked) {
                      context.read<DigitCheckboxBloc>().add(DigitCheckboxEvent.processUncheckCommand);
                    } else {
                      context.read<DigitCheckboxBloc>().add(DigitCheckboxEvent.processCheckCommand);
                    }

                    // Stop listening when manually tapping the checkbox
                    context.read<DigitCheckboxBloc>().add(DigitCheckboxEvent.stopListening);
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: CheckboxIcon(
                        value: isChecked,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (enableVoice)
                      IconButton(
                        icon: Icon(
                          state == DigitCheckboxState.listening
                              ? Icons.mic
                              : Icons.mic_none,
                          color: state == DigitCheckboxState.listening
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        onPressed: () {
                          if (state == DigitCheckboxState.listening) {
                            context.read<DigitCheckboxBloc>().add(DigitCheckboxEvent.stopListening);
                          } else {
                            context.read<DigitCheckboxBloc>().add(DigitCheckboxEvent.startListening);
                          }
                        },
                      ),
                  ],
                ),
              );
            },
          ),
          if (enableVoice)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Say 'check' to mark checkbox and 'uncheck' to unmark",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
        ],
      ),
    );
  }
}



// old code 


// import 'package:digit_components/widgets/atoms/checkbox_icon.dart';
// import 'package:flutter/material.dart';

// /*A single checkbox component */
// class DigitCheckbox extends StatelessWidget {
//   final bool value;
//   final String label;
//   final ValueChanged<bool?>? onChanged;
//   final EdgeInsetsGeometry padding;

//   // Constructor for the DigitCheckbox widget with required parameters
//   const DigitCheckbox({
//     super.key,
//     required this.label,
//     this.onChanged,
//     this.value = false,
//     this.padding = const EdgeInsets.only(left: 4.0),
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Padding(
//       padding: padding,
//       child: InkWell(
//         onTap: () => onChanged?.call(!value),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//                 height: 24,
//                 width: 24,
//                 child: CheckboxIcon(
//                   value: value,
//                 )),
//             const SizedBox(width: 16),
//             Text(
//               label,
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

