
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// Events for the DigitCheckboxBloc
enum DigitCheckboxEvent {
  startListening,        // Starts the speech recognition and listening process
  stopListening,         // Stops the speech recognition process
  processCheckCommand,   // Processes the 'check' command
  processUncheckCommand  // Processes the 'uncheck' command
}

/// States for the DigitCheckboxBloc
enum DigitCheckboxState {
  notListening,   // Indicates the BLoC is not currently listening for commands
  listening,      // Indicates the BLoC is actively listening for commands
  checked,        // Indicates the checkbox is checked
  unchecked       // Indicates the checkbox is unchecked
}

/// BLoC for managing the state of a checkbox based on voice commands
class DigitCheckboxBloc extends Bloc<DigitCheckboxEvent, DigitCheckboxState> {
  late stt.SpeechToText _speech; // Instance of SpeechToText for voice recognition
  bool _isListening = false;     // Tracks whether the BLoC is currently listening

  /// Constructs the DigitCheckboxBloc and initializes the speech recognition
  DigitCheckboxBloc() : super(DigitCheckboxState.notListening) {
    _speech = stt.SpeechToText();

    // Handle incoming events
    on<DigitCheckboxEvent>((event, emit) async {
      switch (event) {
        case DigitCheckboxEvent.startListening:
          // Start the listening process for voice commands
          debugPrint('start listening');
          if (await _speech.initialize()) {
            _isListening = true;
            _speech.listen(onResult: (result) {
              final command = result.recognizedWords.toLowerCase();
              debugPrint('Command: $command');
              
              // Check if the recognized command contains 'check' or 'uncheck'
              if (command.contains('check')) {
                // If 'uncheck' is also present, prioritize 'uncheck'
                if (command.contains('uncheck')) {
                  debugPrint('Processing uncheck command');
                  add(DigitCheckboxEvent.processUncheckCommand); // Trigger uncheck command processing
                } else {
                  debugPrint('Processing check command');
                  add(DigitCheckboxEvent.processCheckCommand);  // Trigger check command processing
                }
              }
            });
            emit(DigitCheckboxState.listening); // Emit state to indicate listening
            debugPrint('Listening');
          }
          break;

        case DigitCheckboxEvent.stopListening:
          // Stop listening if currently active
          if (_isListening) {
            _speech.stop();
            _isListening = false;
            emit(DigitCheckboxState.notListening); // Emit state to indicate not listening
          }
          break;

        case DigitCheckboxEvent.processCheckCommand:
          // Process the 'check' command and update the checkbox state
          debugPrint('Processing command: check');
          emit(DigitCheckboxState.checked); // Emit state to indicate checked
          break;

        case DigitCheckboxEvent.processUncheckCommand:
          // Process the 'uncheck' command and update the checkbox state
          debugPrint('Processing command: uncheck');
          emit(DigitCheckboxState.unchecked); // Emit state to indicate unchecked
          break;
      }
    });
  }
}
