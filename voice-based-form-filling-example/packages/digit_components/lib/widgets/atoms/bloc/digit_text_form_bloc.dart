/* The BLoC (Business Logic Component) pattern is used to separate business logic from UI code,
making applications more manageable and testable. The pattern consists of three main components:

1. Events:
   - Actions that can be dispatched to trigger changes in the state.

2. State:
   - The current state of the application or feature.

3. BLoC (Business Logic Component):
   - Handles the business logic and maps events to states.

 Flow of BLoC Pattern:

 1. Event Dispatching:
    - The UI or another component dispatches an event (e.g., StartListening).

 2. Event Handling:
    - The BLoC listens for these events and performs the required logic.
    - For instance, in the VoiceBloc, the StartListening event triggers initialization of speech recognition 
      and starts listening if not already active.

 3. State Emission:
    - After processing the event, the BLoC emits a new state (e.g., VoiceListening, VoiceStopped, VoiceTextUpdated).

 4. UI Updates:
    - The UI listens to these states and updates accordingly.
    - For example, when the state is VoiceTextUpdated, the UI would display the recognized text.

 Use Case:

 1. Events:
    - StartListening: Begins the voice recognition process.
    - StopListening: Stops the voice recognition process.
    - UpdateText: Updates the recognized text from voice input.

 2. State:
    - VoiceInitial: The initial state before any interaction.
    - VoiceListening: Indicates that the system is currently listening for voice input.
    - VoiceStopped: Indicates that listening has been stopped.
    - VoiceTextUpdated: Carries the updated text recognized from voice input.

 3. BLoC:
    - The VoiceBloc processes these events and manages the state transitions accordingly.
    - It initializes the speech-to-text service, starts and stops listening, and handles recognized text.

This approach ensures that your application's voice recognition logic is cleanly separated from the UI logic,
making it easier to maintain and test.

*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class DigitTextFormBloc extends Bloc<VoiceEvent, VoiceState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _isInitialized = false;

  DigitTextFormBloc() : super(VoiceInitial()) {
    // Initialize method
    _initializeSpeech();

    on<StartListening>((event, emit) async {
      debugPrint('StartListening event received');

      if (!_isInitialized) {
        _isInitialized = await _speech.initialize();
        debugPrint('Speech recognition initialized: $_isInitialized');
        _resetListeningState();
      }

      if (_isInitialized && !_isListening) {
        _speech.listen(onResult: (result) {
          debugPrint('Recognized words: ${result.recognizedWords}');
          add(UpdateText(result.recognizedWords));
        });
        _isListening = true;
        emit(VoiceListening());
        debugPrint('VoiceListening state emitted');
      } else if (!_isInitialized) {
        emit(VoiceStopped());
        debugPrint('VoiceStopped state emitted (initialization failed)');
      }
    });

    on<StopListening>((event, emit) async {
      debugPrint('StopListening event received');
      if (_isListening) {
        await _speech.stop();
        _isListening = false;
        emit(VoiceStopped());
        debugPrint('VoiceStopped state emitted');
      }
    });

    on<UpdateText>((event, emit) {
      debugPrint('UpdateText event received with text: ${event.text}');
      emit(VoiceTextUpdated(event.text));
      _isListening = false;
      _resetListeningState();
    });
  }

  // Speech initialization
  void _initializeSpeech() async {
    _isInitialized = await _speech.initialize();
    debugPrint('Speech recognition initialized: $_isInitialized');
  }

  // Method to reset _isListening based on actual speech service state
  void _resetListeningState() {
    if (!_speech.isListening && _isListening) {
      _isListening = false;
      debugPrint('Reset _isListening flag to false');
    }
  }
}

 
// Event


abstract class VoiceEvent {}

class StartListening extends VoiceEvent {}

class StopListening extends VoiceEvent {}

class UpdateText extends VoiceEvent {
  final String text;
  UpdateText(this.text);
}


// States

abstract class VoiceState {}

class VoiceInitial extends VoiceState {}

class VoiceListening extends VoiceState {}

class VoiceStopped extends VoiceState {}

class VoiceTextUpdated extends VoiceState {
  final String text;
  VoiceTextUpdated(this.text);
}


