


import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../theme/colors.dart';
import 'bloc/digit_radio_button_bloc.dart';


class DigitRadioButtonList<T> extends StatelessWidget {
  final String labelText;
  final TextStyle? labelStyle;
  final bool isRequired;
  final String formControlName;
  final String Function(T value) valueMapper;
  final List<T> options;
  final ValueChanged<T>? onValueChange;
  final bool? isEnabled;
  final Widget? secondaryWidget;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? labelPadding;
  final void Function(FormControl<dynamic>)? onChangeOfFormControl;
  final String errorMessage;
  final bool enableVoice;

  const DigitRadioButtonList({
    super.key,
    this.isEnabled,
    required this.formControlName,
    this.secondaryWidget,
    required this.valueMapper,
    this.labelText = '',
    this.isRequired = false,
    required this.options,
    this.onValueChange,
    this.visualDensity,
    this.contentPadding,
    this.margin,
    this.labelPadding,
    this.labelStyle,
    this.onChangeOfFormControl,
    required this.errorMessage,
    this.enableVoice = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DigitRadioButtonListBloc(),
      child: Builder(
        builder: (context) {
          final bloc = BlocProvider.of<DigitRadioButtonListBloc>(context);

          return Container(
            margin: margin ?? const EdgeInsets.only(top: 12.0, bottom: 5, right: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              labelText.trim().isNotEmpty
                  ? Container(
                      padding: labelPadding ?? const EdgeInsets.only(top: 18, bottom: 3, left: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: <Widget>[
                          Flexible(
                              child: Text(
                            labelText + (isRequired ? ' * ' : ''),
                            textAlign: TextAlign.left,
                            style: labelStyle ?? 
                                DigitTheme.instance.mobileTheme.textTheme.headlineMedium,
                          )),
                          if (enableVoice) // Show mic icon if voice is enabled
                            IconButton(
                              icon: BlocBuilder<DigitRadioButtonListBloc, DigitRadioButtonListState>(
                                builder: (context, state) {
                                  return Icon(
                                    state is ListeningState ? Icons.mic : Icons.mic_none,
                                  );
                                },
                              ),
                              onPressed: () {
                                if (BlocProvider.of<DigitRadioButtonListBloc>(context)
                                    .state is ListeningState) {
                                  bloc.add(StopListening());
                                } else {
                                  bloc.add(StartListening());
                                }
                              },
                            ),
                        ]),
                      ),
                    )
                  : const SizedBox.shrink(),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map(
                    (data) {
                      return ReactiveRadioListTile<T>(
                        activeColor: isEnabled == false
                            ? const DigitColors().cloudGray
                            : DigitTheme.instance.colorScheme.secondary,
                        formControlName: formControlName,
                        contentPadding: contentPadding ?? const EdgeInsets.all(0),
                        title: Text(
                          valueMapper(data),
                          style: TextStyle(
                              color: isEnabled == false
                                  ? const DigitColors().hintGrey
                                  : const DigitColors().woodsmokeBlack),
                        ),
                        value: data,
                        visualDensity: visualDensity ??
                            const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                        onChanged: (isEnabled == true)
                            ? (control) {
                                final value = control.value;
                                if (value == null) return;
                                onValueChange?.call(value);
                              }
                            : null,
                        secondary: secondaryWidget != null
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width / 2.8,
                                child: secondaryWidget)
                            : null,
                      );
                    },
                  ).toList()),
              BlocListener<DigitRadioButtonListBloc, DigitRadioButtonListState>(
                listener: (context, state) {
                  if (state is SpeechRecognitionSuccess) {
                    _showSnackBar(context, 'Selected: ${state.recognizedWords}');
                    _matchVoiceInputToOption(state.recognizedWords, context);
                  } else if (state is NoMatchFound) {
                    _showSnackBar(context, 'Nothing found');
                  }
                },
                child: SizedBox.shrink(),
              ),
            ]),
          );
        },
      ),
    );
  }

  void _matchVoiceInputToOption(String input, BuildContext context) {
    String matchedOption = options.map((e) => valueMapper(e)).firstWhere(
      (option) => option.toLowerCase() == input.toLowerCase(),
      orElse: () => 'Nothing found',
    );

    if (matchedOption != 'Nothing found') {
      final selectedValue = options.firstWhere(
        (option) => valueMapper(option) == matchedOption,
      );
      onValueChange?.call(selectedValue);
      FormGroup form = ReactiveForm.of(context)! as FormGroup;
      form.control(formControlName).value = selectedValue;
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }
}










// old code 

// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class DigitRadioButtonList<T> extends StatelessWidget {
//   final String labelText;
//   final TextStyle? labelStyle;
//   final bool isRequired;
//   final String formControlName;
//   final String Function(T value) valueMapper;
//   final List<T> options;
//   final ValueChanged<T>? onValueChange;
//   final bool? isEnabled;
//   final Widget? secondaryWidget;
//   final VisualDensity? visualDensity;
//   final EdgeInsetsGeometry? contentPadding;
//   final EdgeInsetsGeometry? margin;
//   final EdgeInsetsGeometry? labelPadding;
//   final void Function(FormControl<dynamic>)? onChangeOfFormControl;
//   final String errorMessage;

//   const DigitRadioButtonList({
//     super.key,
//     this.isEnabled,
//     required this.formControlName,
//     this.secondaryWidget,
//     required this.valueMapper,
//     this.labelText = '',
//     this.isRequired = false,
//     required this.options,
//     this.onValueChange,
//     this.visualDensity,
//     this.contentPadding,
//     this.margin,
//     this.labelPadding,
//     this.labelStyle,
//     this.onChangeOfFormControl,
//     required this.errorMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin ?? const EdgeInsets.only(top: 12.0, bottom: 5, right: 8),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         labelText.trim().isNotEmpty
//             ? Container(
//                 padding: labelPadding ??
//                     const EdgeInsets.only(top: 18, bottom: 3, left: 8),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Row(children: <Widget>[
//                     Flexible(
//                         child: Text(
//                       labelText + (isRequired ? ' * ' : ''),
//                       textAlign: TextAlign.left,
//                       style: labelStyle ??
//                           DigitTheme
//                               .instance.mobileTheme.textTheme.headlineMedium,
//                     )),
//                   ]),
//                 ),
//               )
//             : const SizedBox.shrink(),
//         Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: options.map(
//               (data) {
//                 return ReactiveRadioListTile<T>(
//                   activeColor: isEnabled == false
//                       ? const DigitColors().cloudGray
//                       : DigitTheme.instance.colorScheme.secondary,
//                   formControlName: formControlName,
//                   contentPadding: contentPadding ?? const EdgeInsets.all(0),
//                   title: Text(
//                     valueMapper(data),
//                     style: TextStyle(
//                         color: isEnabled == false
//                             ? const DigitColors().hintGrey
//                             : const DigitColors().woodsmokeBlack),
//                   ),
//                   value: data,
//                   visualDensity: visualDensity ??
//                       const VisualDensity(
//                           horizontal: VisualDensity.minimumDensity,
//                           vertical: VisualDensity.minimumDensity),
//                   onChanged: (isEnabled == true)
//                       ? (control) {
//                           final value = control.value;
//                           if (value == null) return;
//                           onValueChange?.call(value);
//                         }
//                       : null,
//                   secondary: secondaryWidget != null
//                       ? SizedBox(
//                           width: MediaQuery.of(context).size.width / 2.8,
//                           child: secondaryWidget)
//                       : null,
//                 );
//               },
//             ).toList()),
//         ReactiveFormConsumer(
//           builder: (context, form, child) {
//             final radioListControl = form.control(formControlName);
//             if (radioListControl.hasErrors) {
//               return Text(
//                 errorMessage,
//                 style: TextStyle(
//                     color: DigitTheme.instance.colorScheme.error, fontSize: 12),
//               );
//             } else {
//               return const SizedBox.shrink();
//             }
//           },
//         ),
//       ]),
//     );
//   }
// }


