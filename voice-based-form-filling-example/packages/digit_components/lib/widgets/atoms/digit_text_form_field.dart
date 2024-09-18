import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_text_form_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';


class DigitTextFormField extends StatefulWidget {
  final bool readOnly;
  final String formControlName;
  final String? hint;
  final String? hintText;
  final Widget? suffix;
  final bool isRequired;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool obscureText;
  final String label;
  final int? minLength;
  final Widget? suffixIcon;
  final void Function(FormControl<dynamic>)? onChanged;
  final TextCapitalization textCapitalization;
  final ControlValueAccessor<dynamic, String>? valueAccessor;
  final Map<String, String Function(Object control)>? validationMessages;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final bool? hideKeyboard;
  final bool enableVoiceCommand;

  const DigitTextFormField({
    super.key,
    required this.label,
    required this.formControlName,
    this.hint,
    this.suffix,
    this.minLines = 1,
    this.maxLines = 1,
    this.valueAccessor,
    this.maxLength,
    this.onTap,
    this.focusNode,
    this.validationMessages,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.isRequired = false,
    this.readOnly = false,
    this.onChanged,
    this.minLength,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixText,
    this.hintText,
    this.labelStyle,
    this.padding,
    this.hideKeyboard = false,
    this.enableVoiceCommand = false,
  });

  @override
  _DigitTextFormFieldState createState() => _DigitTextFormFieldState();
}

class _DigitTextFormFieldState extends State<DigitTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    return BlocBuilder<DigitTextFormBloc, VoiceState>(
      builder: (context, state) {
        String recognizedText = '';
        if (state is VoiceTextUpdated) {
          recognizedText = state.text;
          form.control(widget.formControlName).value = recognizedText;
        }

        return LabeledField(
          label: '${widget.label} ${widget.isRequired ? '*' : ''}',
          padding: widget.padding ??
              const EdgeInsets.only(
                top: kPadding * 2,
              ),
          labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
          child: Column(
            children: [
              Container(
                color: widget.readOnly ? const DigitColors().seaShellGray : null,
                child: ReactiveTextField(
                  onChanged: widget.onChanged,
                  readOnly: widget.readOnly,
                  formControlName: widget.formControlName,
                  maxLength: widget.maxLength,
                  validationMessages: widget.validationMessages,
                  autofocus: false,
                  textCapitalization: widget.textCapitalization,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: (widget.readOnly && widget.hideKeyboard == false)
                        ? const DigitColors().davyGray
                        : DigitTheme.instance.colorScheme.onBackground,
                  ),
                  obscureText: widget.obscureText,
                  focusNode: widget.focusNode,
                  keyboardType: widget.keyboardType,
                  inputFormatters: [
                    RemoveEmojiInputFormatter(),
                    ...?widget.inputFormatters
                  ],
                  valueAccessor: widget.valueAccessor,
                  decoration: (widget.readOnly && widget.hideKeyboard == false)
                      ? InputDecoration(
                          enabledBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          fillColor: DigitTheme.instance.colors.cloudGray,
                          focusedBorder: DigitTheme
                              .instance.inputDecorationTheme.disabledBorder,
                          focusColor: DigitTheme.instance.colors.cloudGray,
                          suffixIcon: widget.enableVoiceCommand
                              ? IconButton(
                                  icon: Icon(context.watch<DigitTextFormBloc>().state is VoiceListening
                                      ? Icons.mic
                                      : Icons.mic_none),
                                  onPressed: () {
                                    final voiceBloc = context.read<DigitTextFormBloc>();
                                    if (context.read<DigitTextFormBloc>().state
                                        is VoiceListening) {
                                      voiceBloc.add(StopListening());
                                    } else {
                                      voiceBloc.add(StartListening());
                                    }
                                  },
                                )
                              : (widget.suffix == null
                                  ? null
                                  : InkWell(
                                      onTap: widget.onTap,
                                      child: widget.suffix,
                                    )),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          prefixStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: widget.readOnly
                                  ? const DigitColors().hintGrey
                                  : DigitTheme.instance.colorScheme.onBackground),
                          prefixIcon: widget.prefixIcon ??
                              (widget.prefixText == ''
                                  ? null
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, bottom: 10, right: 0),
                                      child: Text(
                                        widget.prefixText ?? '',
                                        style: TextStyle(
                                            fontSize: kIsWeb ? 15 : 16,
                                            fontWeight: FontWeight.w200,
                                            color: widget.readOnly
                                                ? const DigitColors().hintGrey
                                                : DigitTheme
                                                    .instance.colorScheme
                                                    .onBackground),
                                      ),
                                    )),
                        )
                      : InputDecoration(
                          labelText: widget.hint,
                          suffixIconConstraints: const BoxConstraints(
                            maxHeight: 40,
                            maxWidth: 100,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          prefixStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: widget.readOnly
                                ? const DigitColors().hintGrey
                                : DigitTheme.instance.colorScheme.onBackground,
                          ),
                          prefixIcon: widget.prefixIcon ??
                              (widget.prefixText == ''
                                  ? null
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, bottom: 10, right: 0),
                                      child: Text(
                                        widget.prefixText ?? '',
                                        style: TextStyle(
                                          fontSize: kIsWeb ? 15 : 16,
                                          fontWeight: FontWeight.w400,
                                          color: widget.readOnly
                                              ? const DigitColors().hintGrey
                                              : DigitTheme.instance.colorScheme
                                                  .onBackground,
                                        ),
                                      ),
                                    )),
                          suffixIcon: widget.enableVoiceCommand
                              ? IconButton(
                                  icon: Icon(context.watch<DigitTextFormBloc>().state is VoiceListening
                                      ? Icons.mic
                                      : Icons.mic_none),
                                  onPressed: () {
                                    final voiceBloc = context.read<DigitTextFormBloc>();
                                    if (context.read<DigitTextFormBloc>().state is VoiceListening) {
                                      voiceBloc.add(StopListening());
                                    } else {
                                      voiceBloc.add(StartListening());
                                    }
                                  },
                                )
                              : (widget.suffix == null
                                  ? null
                                  : InkWell(
                                      onTap: widget.onTap,
                                      child: widget.suffix,
                                    )),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}












// old code


// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:flutter_tts/flutter_tts.dart';

// class DigitTextFormField extends StatefulWidget {
//   final bool readOnly;
//   final String formControlName;
//   final String? hint;
//   final String? hintText;
//   final Widget? suffix;
//   final bool isRequired;
//   final int minLines;
//   final int maxLines;
//   final int? maxLength;
//   final TextInputType keyboardType;
//   final FocusNode? focusNode;
//   final VoidCallback? onTap;
//   final bool obscureText;
//   final String label;
//   final int? minLength;
//   final Widget? suffixIcon;
//   final void Function(FormControl<dynamic>)? onChanged;
//   final TextCapitalization textCapitalization;
//   final ControlValueAccessor<dynamic, String>? valueAccessor;
//   final Map<String, String Function(Object control)>? validationMessages;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? prefixText;
//   final Widget? prefixIcon;
//   final TextStyle? labelStyle;
//   final EdgeInsets? padding;
//   final bool? hideKeyboard;
//   final bool enableVoiceCommand;

//   const DigitTextFormField({
//     super.key,
//     required this.label,
//     required this.formControlName,
//     this.hint,
//     this.suffix,
//     this.minLines = 1,
//     this.maxLines = 1,
//     this.valueAccessor,
//     this.maxLength,
//     this.onTap,
//     this.focusNode,
//     this.validationMessages,
//     this.suffixIcon,
//     this.keyboardType = TextInputType.text,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.obscureText = false,
//     this.isRequired = false,
//     this.readOnly = false,
//     this.onChanged,
//     this.minLength,
//     this.inputFormatters,
//     this.prefixIcon,
//     this.prefixText,
//     this.hintText,
//     this.labelStyle,
//     this.padding,
//     this.hideKeyboard = false,
//     this.enableVoiceCommand = false,
//   });

//   @override
//   _DigitTextFormFieldState createState() => _DigitTextFormFieldState();
// }

// class _DigitTextFormFieldState extends State<DigitTextFormField> {
//   late stt.SpeechToText _speech;
//   late FlutterTts _flutterTts;
//   bool _isListening = false;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//     _flutterTts = FlutterTts();
//   }

//   @override
//   void dispose() {
//     _flutterTts.stop();
//     super.dispose();
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => setState(() {
//           _isListening = val == 'listening';
//         }),
//         onError: (val) => setState(() {
//           _isListening = false;
//         }),
//       );

//       if (available) {
//         setState(() {
//           _isListening = true;
//         });

//         _speech.listen(onResult: (val) {
//           setState(() {
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               final form = ReactiveForm.of(context) as FormGroup;
//               final control = form.control(widget.formControlName);
//               control.value = val.recognizedWords;
//             }
//           });
//         });

//         await _flutterTts.setLanguage('en-US');
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//       });
//       _speech.stop();
//       _flutterTts.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) => LabeledField(
//         label: '${widget.label} ${widget.isRequired ? '*' : ''}',
//         padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
//         labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
//         child: Column(
//           children: [
//             Container(
//               color: (widget.readOnly) ? const DigitColors().seaShellGray : null,
//               child: ReactiveTextField(
//                 onChanged: widget.onChanged,
//                 readOnly: widget.readOnly,
//                 formControlName: widget.formControlName,
//                 maxLength: widget.maxLength,
//                 validationMessages: widget.validationMessages,
//                 autofocus: false,
//                 textCapitalization: widget.textCapitalization,
//                 minLines: widget.minLines,
//                 maxLines: widget.maxLines,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: (widget.readOnly && widget.hideKeyboard == false)
//                       ? const DigitColors().davyGray
//                       : DigitTheme.instance.colorScheme.onBackground,
//                 ),
//                 obscureText: widget.obscureText,
//                 focusNode: widget.focusNode,
//                 keyboardType: widget.keyboardType,
//                 inputFormatters: [
//                   RemoveEmojiInputFormatter(),
//                   ...?widget.inputFormatters,
//                 ],
//                 valueAccessor: widget.valueAccessor,
//                 decoration: InputDecoration(
//                   labelText: widget.hint,
//                   suffixIconConstraints: const BoxConstraints(
//                     maxHeight: 40,
//                     maxWidth: 100,
//                   ),
//                   prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
//                   prefixStyle: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: widget.readOnly ? const DigitColors().hintGrey : DigitTheme.instance.colorScheme.onBackground,
//                   ),
//                   prefixIcon: widget.prefixIcon ??
//                       (widget.prefixText == ''
//                           ? null
//                           : Padding(
//                               padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 0),
//                               child: Text(
//                                 widget.prefixText ?? '',
//                                 style: TextStyle(
//                                   fontSize: kIsWeb ? 15 : 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: widget.readOnly ? const DigitColors().hintGrey : DigitTheme.instance.colorScheme.onBackground,
//                                 ),
//                               ),
//                             )),
//                   suffixIcon: widget.enableVoiceCommand
//                       ? IconButton(
//                           icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
//                           onPressed: _listen,
//                         )
//                       : (widget.suffix == null
//                           ? null
//                           : InkWell(
//                               onTap: widget.onTap,
//                               child: widget.suffix,
//                             )),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 widget.hintText ?? '',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: const DigitColors().hintGrey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }


// // Resolved the internt bug issue with the voice command feature
// // ready for presentation in tech council 
// import 'package:digit_components/digit_components.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class DigitTextFormField extends StatefulWidget {
//   final bool readOnly;
//   final String formControlName;
//   final String? hint;
//   final String? hintText;
//   final Widget? suffix;
//   final bool isRequired;
//   final int minLines;
//   final int maxLines;
//   final int? maxLength;
//   final TextInputType keyboardType;
//   final FocusNode? focusNode;
//   final VoidCallback? onTap;
//   final bool obscureText;
//   final String label;
//   final int? minLength;
//   final Widget? suffixIcon;
//   final void Function(FormControl<dynamic>)? onChanged;
//   final TextCapitalization textCapitalization;
//   final ControlValueAccessor<dynamic, String>? valueAccessor;
//   final Map<String, String Function(Object control)>? validationMessages;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? prefixText;
//   final Widget? prefixIcon;
//   final TextStyle? labelStyle;
//   final EdgeInsets? padding;
//   final bool? hideKeyboard;
//   final bool enableVoiceCommand;

//   const DigitTextFormField({
//     super.key,
//     required this.label,
//     required this.formControlName,
//     this.hint,
//     this.suffix,
//     this.minLines = 1,
//     this.maxLines = 1,
//     this.valueAccessor,
//     this.maxLength,
//     this.onTap,
//     this.focusNode,
//     this.validationMessages,
//     this.suffixIcon,
//     this.keyboardType = TextInputType.text,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.obscureText = false,
//     this.isRequired = false,
//     this.readOnly = false,
//     this.onChanged,
//     this.minLength,
//     this.inputFormatters,
//     this.prefixIcon,
//     this.prefixText,
//     this.hintText,
//     this.labelStyle,
//     this.padding,
//     this.hideKeyboard = false,
//     this.enableVoiceCommand = false,
//   });

//   @override
//   _DigitTextFormFieldState createState() => _DigitTextFormFieldState();
// }

// class _DigitTextFormFieldState extends State<DigitTextFormField> {
//   late stt.SpeechToText _speech;
//   bool _isListening = false;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//     _initializeSpeech();
//   }

//   void _initializeSpeech() async {
//     bool available = await _speech.initialize(
//       onStatus: (val) => setState(() {
//         _isListening = val == 'listening';
//       }),
//       onError: (val) => setState(() {
//         _isListening = false;
//       }),
//     );
//     if (!available) {
//       print('Speech recognition not available');
//     }
//   }

//   void _listen(FormGroup form) async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => setState(() {
//           _isListening = val == 'listening';
//         }),
//         onError: (val) => setState(() {
//           _isListening = false;
//         }),
//       );

//       if (available) {
//         setState(() {
//           _isListening = true;
//         });

//         _speech.listen(onResult: (val) {
//           setState(() {
//             form.control(widget.formControlName).value = val.recognizedWords;
//           });
//         });
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//       });
//       _speech.stop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final form = ReactiveForm.of(context) as FormGroup;

//     return LabeledField(
//       label: '${widget.label} ${widget.isRequired ? '*' : ''}',
//       padding: widget.padding ??
//           const EdgeInsets.only(
//             top: kPadding * 2,
//           ),
//       labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
//       child: Column(
//         children: [
//           Container(
//             color: (widget.readOnly) ? const DigitColors().seaShellGray : null,
//             child: ReactiveTextField(
//               onChanged: widget.onChanged,
//               readOnly: widget.readOnly,
//               formControlName: widget.formControlName,
//               maxLength: widget.maxLength,
//               validationMessages: widget.validationMessages,
//               autofocus: false,
//               textCapitalization: widget.textCapitalization,
//               minLines: widget.minLines,
//               maxLines: widget.maxLines,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: (widget.readOnly && widget.hideKeyboard == false)
//                     ? const DigitColors().davyGray
//                     : DigitTheme.instance.colorScheme.onBackground,
//               ),
//               obscureText: widget.obscureText,
//               focusNode: widget.focusNode,
//               keyboardType: widget.keyboardType,
//               inputFormatters: [
//                 RemoveEmojiInputFormatter(),
//                 ...?widget.inputFormatters
//               ],
//               valueAccessor: widget.valueAccessor,
//               decoration: (widget.readOnly && widget.hideKeyboard == false)
//                   ? InputDecoration(
//                       enabledBorder: DigitTheme
//                           .instance.inputDecorationTheme.disabledBorder,
//                       fillColor: DigitTheme.instance.colors.cloudGray,
//                       focusedBorder: DigitTheme
//                           .instance.inputDecorationTheme.disabledBorder,
//                       focusColor: DigitTheme.instance.colors.cloudGray,
//                       suffixIcon: widget.enableVoiceCommand
//                           ? IconButton(
//                               icon: Icon(_isListening
//                                   ? Icons.mic
//                                   : Icons.mic_none),
//                               onPressed: () => _listen(form),
//                             )
//                           : (widget.suffix == null
//                               ? null
//                               : InkWell(
//                                   onTap: widget.onTap,
//                                   child: widget.suffix,
//                                 )),
//                       prefixIconConstraints:
//                           const BoxConstraints(minWidth: 0, minHeight: 0),
//                       prefixStyle: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w200,
//                           color: widget.readOnly
//                               ? const DigitColors().hintGrey
//                               : DigitTheme
//                                   .instance.colorScheme.onBackground),
//                       prefixIcon: widget.prefixIcon ??
//                           (widget.prefixText == ''
//                               ? null
//                               : Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 10, left: 10, bottom: 10, right: 0),
//                                   child: Text(
//                                     widget.prefixText ?? '',
//                                     style: TextStyle(
//                                         fontSize: kIsWeb ? 15 : 16,
//                                         fontWeight: FontWeight.w200,
//                                         color: widget.readOnly
//                                             ? const DigitColors().hintGrey
//                                             : DigitTheme
//                                                 .instance.colorScheme
//                                                 .onBackground),
//                                   ),
//                                 )),
//                     )
//                   : InputDecoration(
//                       labelText: widget.hint,
//                       suffixIconConstraints: const BoxConstraints(
//                         maxHeight: 40,
//                         maxWidth: 100,
//                       ),
//                       prefixIconConstraints:
//                           const BoxConstraints(minWidth: 0, minHeight: 0),
//                       prefixStyle: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: widget.readOnly
//                             ? const DigitColors().hintGrey
//                             : DigitTheme.instance.colorScheme.onBackground,
//                       ),
//                       prefixIcon: widget.prefixIcon ??
//                           (widget.prefixText == ''
//                               ? null
//                               : Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 10, left: 10, bottom: 10, right: 0),
//                                   child: Text(
//                                     widget.prefixText ?? '',
//                                     style: TextStyle(
//                                       fontSize: kIsWeb ? 15 : 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: widget.readOnly
//                                           ? const DigitColors().hintGrey
//                                           : DigitTheme.instance.colorScheme
//                                               .onBackground,
//                                     ),
//                                   ),
//                                 )),
//                       suffixIcon: widget.enableVoiceCommand
//                           ? IconButton(
//                               icon: Icon(_isListening
//                                   ? Icons.mic
//                                   : Icons.mic_none),
//                               onPressed: () => _listen(form),
//                             )
//                           : (widget.suffix == null
//                               ? null
//                               : InkWell(
//                                   onTap: widget.onTap,
//                                   child: widget.suffix,
//                                 )),
//                     ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(widget.hintText ?? '',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   color: const DigitColors().hintGrey,
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }


