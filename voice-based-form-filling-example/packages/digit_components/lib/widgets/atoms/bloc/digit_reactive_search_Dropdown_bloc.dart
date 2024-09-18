import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/*

 * BLoC Events:
 * 
 * Abstract class `DigitReactiveSearchDropdownEvent` represents all possible events
 * for the DigitReactiveSearchDropdown BLoC. Specific event classes extend this abstract
 * class to define various actions that can be triggered.
 
 */
abstract class DigitReactiveSearchDropdownEvent {}

/// Event to start listening to voice input.
class StartListening extends DigitReactiveSearchDropdownEvent {}

/// Event to stop listening to voice input.
class StopListening extends DigitReactiveSearchDropdownEvent {}

/// Event that carries the recognized text from the speech recognition process.
class SpeechResult extends DigitReactiveSearchDropdownEvent {
  final String recognizedWords;

  SpeechResult(this.recognizedWords);
}

/// Event to reset the listening state.
class ResetListening extends DigitReactiveSearchDropdownEvent {}

/*

 * BLoC States:
 * 
 * Abstract class `DigitReactiveSearchDropdownState` represents all possible states
 * for the DigitReactiveSearchDropdown BLoC. Specific state classes extend this abstract
 * class to define different states of the BLoC.
 
 */
abstract class DigitReactiveSearchDropdownState {}

/// Initial state when the BLoC is created.
class DigitReactiveSearchDropdownInitial extends DigitReactiveSearchDropdownState {}

/// State indicating that the BLoC is currently listening for voice input.
class ListeningState extends DigitReactiveSearchDropdownState {}

/// State indicating that the BLoC is not listening for voice input.
class NotListeningState extends DigitReactiveSearchDropdownState {}

/// State representing successful speech recognition with recognized words.
class SpeechRecognitionSuccess extends DigitReactiveSearchDropdownState {
  final String recognizedWords;

  SpeechRecognitionSuccess(this.recognizedWords);
}

/// State indicating that no match was found for the recognized words.
class NoMatchFound extends DigitReactiveSearchDropdownState {}

/*

 * BLoC Implementation:
 * 
 * `DigitReactiveSearchDropdownBloc` handles the business logic related to speech recognition.
 * It manages the state transitions based on events and interacts with the speech-to-text service.
  
 */
class DigitReactiveSearchDropdownBloc
    extends Bloc<DigitReactiveSearchDropdownEvent, DigitReactiveSearchDropdownState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _isInitialized = false; // Track initialization status

  /// Constructor initializes the BLoC with the initial state.
  DigitReactiveSearchDropdownBloc() : super(DigitReactiveSearchDropdownInitial()) {
    // Event handler for StartListening event
    on<StartListening>((event, emit) async {
      debugPrint('Event: StartListening');

      // Initialize speech-to-text service if not already initialized
      if (!_isInitialized) {
        bool available = await _initializeSpeech();
        if (!available) {
          debugPrint('Speech recognition not available');
          return; // Exit if initialization fails
        }
      }

      // Start listening if not already listening
      if (!_isListening) {
        _isListening = true;
        emit(ListeningState()); // Emit ListeningState to indicate listening has started
        _speech.listen(
          onResult: (val) => add(SpeechResult(val.recognizedWords)),
        );
        debugPrint('Listening started');
      } else {
        debugPrint('Already listening');
      }
    });

    // Event handler for StopListening event
    on<StopListening>((event, emit) {
      debugPrint('Event: StopListening');
      _isListening = false;
      _speech.stop(); // Stop the speech recognition service
      emit(NotListeningState()); // Emit NotListeningState to indicate listening has stopped
      debugPrint('Listening stopped');
    });

    // Event handler for SpeechResult event
    on<SpeechResult>((event, emit) async {
      debugPrint('Event: SpeechResult with recognized words: ${event.recognizedWords}');
      emit(SpeechRecognitionSuccess(event.recognizedWords)); // Emit SpeechRecognitionSuccess with recognized words

      // Automatically stop listening after processing the speech result
      add(StopListening());
    });

    // Event handler for ResetListening event
    on<ResetListening>((event, emit) {
      debugPrint('Event: ResetListening');
      _isListening = false;
      emit(NotListeningState()); // Emit NotListeningState to reset the listening state
    });
  }

  /*
   * Initializes the speech-to-text service.
   * 
   * @returns Future<bool> - returns true if initialization is successful, false otherwise.
   */
  Future<bool> _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (val) => debugPrint('onStatus: $val'),
      onError: (val) => debugPrint('onError: $val'),
    );
    _isInitialized = available;
    debugPrint('Speech recognition initialized: $available');
    return available;
  }

  /*
   * Public method to reset the listening state.
   */
  void resetListening() {
    add(ResetListening()); // Dispatch ResetListening event to reset the state
  }
}
