


import 'package:digit_components/widgets/atoms/checkbox_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'atoms/bloc/digit_checkbox_tile_bloc.dart';


class DigitCheckboxTile extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsetsGeometry padding;
  final bool enableVoice;

  const DigitCheckboxTile({
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
          BlocBuilder<DigitCheckboxTileBloc, DigitCheckboxTileState>(
            builder: (context, state) {
              bool isChecked = value; // Use the initial checkbox value

              // Update the checkbox state based on the BLoC's state
              if (state == DigitCheckboxTileState.checked) {
                isChecked = true;
              } else if (state == DigitCheckboxTileState.unchecked) {
                isChecked = false;
              }

              return InkWell(
                onTap: () {
                  // Toggle checkbox manually
                  onChanged?.call(!isChecked);

                  if (enableVoice) {
                    // Update BLoC state when manually toggling
                    if (isChecked) {
                      context.read<DigitCheckboxTileBloc>().add(DigitCheckboxTileEvent.processUncheckCommand);
                    } else {
                      context.read<DigitCheckboxTileBloc>().add(DigitCheckboxTileEvent.processCheckCommand);
                    }

                    // Stop listening when manually tapping the checkbox
                    context.read<DigitCheckboxTileBloc>().add(DigitCheckboxTileEvent.stopListening);
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
                          state == DigitCheckboxTileState.listening
                              ? Icons.mic
                              : Icons.mic_none,
                          color: state == DigitCheckboxTileState.listening
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        onPressed: () {
                          if (state == DigitCheckboxTileState.listening) {
                            context.read<DigitCheckboxTileBloc>().add(DigitCheckboxTileEvent.stopListening);
                          } else {
                            context.read<DigitCheckboxTileBloc>().add(DigitCheckboxTileEvent.startListening);
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


// import 'package:digit_components/digit_components.dart';
// import 'package:digit_components/widgets/atoms/checkbox_icon.dart';
// import 'package:flutter/material.dart';

// class DigitCheckboxTile extends StatelessWidget {
//   final bool value;
//   final String label;
//   final ValueChanged<bool>? onChanged;
//   final EdgeInsets? margin;
//   final EdgeInsets? padding;

//   const DigitCheckboxTile({
//     this.value = false,
//     required this.label,
//     this.onChanged,
//     this.padding,
//     this.margin,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {

//     return Padding(
//       padding: padding ?? const EdgeInsets.all(0),
//       child: InkWell(
//         onTap: () => onChanged?.call(!value),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 0, bottom: kPadding * 2),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               value
//                   ? const CheckboxIcon(
//                       value: true,
//                     )
//                   : const CheckboxIcon(),
//               const SizedBox(width: kPadding * 2),
//               Expanded(
//                 child: Text(
//                   label,
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



