

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// BLoC Events
abstract class DigitRadioButtonListEvent {}

/* 
  Event to start the speech recognition process. 
  Triggers the initialization and listening for speech input.
*/
class StartListening extends DigitRadioButtonListEvent {}

/* 
  Event to stop the speech recognition process.
  This will stop the listening and reset the listening state.
*/
class StopListening extends DigitRadioButtonListEvent {}

/* 
  Event to handle the result of the speech recognition process.
  Contains the recognized words from the speech recognition.
*/
class SpeechResult extends DigitRadioButtonListEvent {
  final String recognizedWords;

  SpeechResult(this.recognizedWords);
}

// BLoC States
abstract class DigitRadioButtonListState {}

/* 
  Initial state of the BLoC, when it is first created.
*/
class DigitRadioButtonListInitial extends DigitRadioButtonListState {}

/* 
  State indicating that the speech recognition is currently active and listening.
*/
class ListeningState extends DigitRadioButtonListState {}

/* 
  State indicating that the speech recognition is not active.
*/
class NotListeningState extends DigitRadioButtonListState {}

/* 
  State representing a successful speech recognition with recognized words.
*/
class SpeechRecognitionSuccess extends DigitRadioButtonListState {
  final String recognizedWords;

  SpeechRecognitionSuccess(this.recognizedWords);
}

/* 
  State indicating that no matching results were found for the speech input.
*/
class NoMatchFound extends DigitRadioButtonListState {}

// BLoC Implementation
class DigitRadioButtonListBloc
    extends Bloc<DigitRadioButtonListEvent, DigitRadioButtonListState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  /* 
    Constructor initializes the BLoC with the initial state and sets up event handlers.
  */
  DigitRadioButtonListBloc() : super(DigitRadioButtonListInitial()) {
    /* 
      Handles the StartListening event. Initializes the speech recognition service and starts listening.
      Emits ListeningState if initialization is successful. If initialization fails, it does not change the state.
    */
    on<StartListening>((event, emit) async {
      debugPrint('Event: StartListening');
      bool available = await _speech.initialize();
      if (available) {
        _isListening = true;
        emit(ListeningState()); // Emit ListeningState to indicate listening has started
        _speech.listen(
          onResult: (result) => add(SpeechResult(result.recognizedWords)),
          // Optionally handle errors here, e.g., onError: (error) => print('Speech error: $error'),
        );
        debugPrint('Listening started');
      } else {
        debugPrint('Speech recognition not available');
      }
    });

    /* 
      Handles the StopListening event. Stops the speech recognition service and emits NotListeningState.
    */
    on<StopListening>((event, emit) {
      debugPrint('Event: StopListening');
      _isListening = false;
      _speech.stop();
      emit(NotListeningState()); // Emit NotListeningState to indicate listening has stopped
      debugPrint('Listening stopped');
    });

    /* 
      Handles the SpeechResult event. Emits SpeechRecognitionSuccess with the recognized words.
    */
    on<SpeechResult>((event, emit) {
      debugPrint('Event: SpeechResult with recognized words: ${event.recognizedWords}');
      emit(SpeechRecognitionSuccess(event.recognizedWords)); // Emit SpeechRecognitionSuccess with the recognized words
    });
  }
}
