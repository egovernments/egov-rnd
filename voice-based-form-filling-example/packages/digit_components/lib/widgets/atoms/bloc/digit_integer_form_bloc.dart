import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_bloc/flutter_bloc.dart';

/*

 * BLoC States:
 * 
 * Abstract class `SpeechState` represents the different states that the `SpeechBloc` can be in.
 
 */
abstract class SpeechState {}

/*
 * State indicating that the BLoC is currently listening for voice input.
 */
class SpeechListeningState extends SpeechState {}

/*
 * State indicating that the BLoC is not listening for voice input.
 */
class SpeechNotListeningState extends SpeechState {}

/*
 * State representing the updated speech text recognized from the voice input.
 */
class SpeechUpdatedState extends SpeechState {
  final String text;

  SpeechUpdatedState(this.text);
}

/*
 * BLoC Events:
 * 
 * Abstract class `SpeechEvent` represents all possible events for the `SpeechBloc`.
 * Specific event classes extend this abstract class to define various actions that can be triggered.
 */
abstract class SpeechEvent {}

/*
 * Event to start listening to voice input.
 */
class StartListeningEvent extends SpeechEvent {}

/*
 * Event to stop listening to voice input.
 */
class StopListeningEvent extends SpeechEvent {}

/*
 * Event that carries the recognized text from the speech recognition process.
 */
class SpeechResultEvent extends SpeechEvent {
  final String text;

  SpeechResultEvent(this.text);
}

/*
 * BLoC Implementation:
 * 
 * `DigitIntegerFormBloc` handles the business logic related to speech recognition using the `speech_to_text` package.
 * It manages state transitions based on events and interacts with the speech-to-text service.
 */
class DigitIntegerFormBloc extends Bloc<SpeechEvent, SpeechState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false; // Track initialization status
  bool _isListening = false;   // Use this flag to check listening status

  /// Constructor initializes the BLoC with the initial state.
  DigitIntegerFormBloc() : super(SpeechNotListeningState()) {
    // Event handler for StartListeningEvent
    on<StartListeningEvent>((event, emit) async {
      debugPrint("Received StartListeningEvent");

      // Initialize the speech-to-text service if not already initialized
      if (!_isInitialized) {
        bool available = await _speech.initialize();
        _isInitialized = available;
        debugPrint("Speech Recognition initialized: $available");
      }

      // Start listening if the service is initialized and not already listening
      if (_isInitialized && !_isListening) {
        _isListening = true; // Update the listening flag
        emit(SpeechListeningState()); // Emit SpeechListeningState to indicate listening has started
        debugPrint("Emitted SpeechListeningState");

        _speech.listen(onResult: (result) {
          debugPrint("Speech recognized: ${result.recognizedWords}");
          add(SpeechResultEvent(result.recognizedWords)); // Add result to events
        });
      }
    });

    // Event handler for StopListeningEvent
    on<StopListeningEvent>((event, emit) {
      debugPrint("Received StopListeningEvent");
      if (_isListening) {
        _speech.stop(); // Stop the speech recognition service
        _isListening = false; // Reset the listening flag
        emit(SpeechNotListeningState()); // Emit SpeechNotListeningState to indicate listening has stopped
        debugPrint("Emitted SpeechNotListeningState");
      }
    });

    // Event handler for SpeechResultEvent
    on<SpeechResultEvent>((event, emit) {
      debugPrint("Received SpeechResultEvent with text: ${event.text}");
      emit(SpeechUpdatedState(event.text)); // Emit SpeechUpdatedState with recognized text
      add(StopListeningEvent()); // Automatically stop listening after result
    });
  }

  /*
   * Public method to reset the listening state.
   */
  void reset() {
    _isListening = false; // Reset the listening flag
    debugPrint("Reset _isListening flag to false");
  }

  /*
   * Public method to stop listening.
   */
  void stopListening() {
    debugPrint("Stopping listening...");
    add(StopListeningEvent()); // Dispatch StopListeningEvent to stop listening
  }

  /*
   * Public method to start listening.
   */
  void startListening() {
    debugPrint("Starting listening...");
    add(StartListeningEvent()); // Dispatch StartListeningEvent to start listening
  }
}
