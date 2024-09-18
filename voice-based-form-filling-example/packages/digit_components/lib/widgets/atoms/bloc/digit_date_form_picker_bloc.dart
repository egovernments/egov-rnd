import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:intl/intl.dart';

// Define the events
abstract class DatePickerEvent {}

/* 
  Event to start listening to the user's voice input.
  This triggers the speech recognition process.
*/
class StartListeningEvent extends DatePickerEvent {}

/* 
  Event to stop listening to the user's voice input.
  This stops the speech recognition process.
*/
class StopListeningEvent extends DatePickerEvent {}

/*
  Event to update the date based on the recognized speech input.
  Contains the recognized words from the speech recognition.
*/
class UpdateDateEvent extends DatePickerEvent {
  final String recognizedWords;
  UpdateDateEvent(this.recognizedWords);
}

// DatePicker BLoC
class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  DatePickerBloc() : super(DatePickerInitial()) {
    /* 
      Handles the StartListeningEvent by starting the speech recognition 
      and updating the state to DatePickerListening.
    */
    on<StartListeningEvent>((event, emit) => _startListening(emit));

    /* 
      Handles the StopListeningEvent by stopping the speech recognition 
      and updating the state to DatePickerNotListening.
    */
    on<StopListeningEvent>((event, emit) => _stopListening(emit));

    /* 
      Handles the UpdateDateEvent by parsing the recognized words to 
      extract a date and updating the state to DatePickerDateUpdated 
      or DatePickerError based on the parsing result.
    */
    on<UpdateDateEvent>((event, emit) => _updateDate(event.recognizedWords, emit));
  }

  /* 
    Starts the speech recognition process if not already listening.
    Updates the state to DatePickerListening and listens for speech results.
  */
  void _startListening(Emitter<DatePickerState> emit) async {
    debugPrint('Starting listening...');
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        _isListening = true;
        emit(DatePickerListening());
        debugPrint('Listening started.');
        _speech.listen(onResult: (result) {
          debugPrint('Speech result received: ${result.recognizedWords}');
          add(UpdateDateEvent(result.recognizedWords));
        });
      } else {
        debugPrint('Speech recognition not available.');
        emit(DatePickerError('Speech recognition not available.'));
      }
    }
  }

  /* 
    Stops the speech recognition process if currently listening.
    Updates the state to DatePickerNotListening.
  */
  void _stopListening(Emitter<DatePickerState> emit) {
    debugPrint('Stopping listening...');
    if (_isListening) {
      _isListening = false;
      _speech.stop();
      debugPrint('Listening stopped.');
      emit(DatePickerNotListening());
    }
  }

  /* 
    Parses the recognized words to extract a date.
    If the date is parsed successfully, updates the state to 
    DatePickerDateUpdated. If parsing fails, updates the state to 
    DatePickerError.
  */
  void _updateDate(String voiceInput, Emitter<DatePickerState> emit) {
    debugPrint('Updating date with voice input: $voiceInput');
    DateTime? parsedDate = _parseDateFromText(voiceInput);
    if (parsedDate != null) {
      debugPrint('Date parsed successfully: $parsedDate');
      emit(DatePickerDateUpdated(parsedDate));
      add(StopListeningEvent()); // Stop listening after updating date
    } else {
      debugPrint('Failed to parse date.');
      emit(DatePickerError('Failed to parse date.'));
    }
  }

  /* 
    Parses a date from the given text.
    Matches month names and day numbers to construct a DateTime object.
    Returns the parsed date or null if parsing fails.
  */
 DateTime? _parseDateFromText(String text) {
  try {
    // Normalize the text by removing extra spaces and converting to lowercase
    final formattedText = text.replaceAll(RegExp(r'\s+'), ' ').toLowerCase();
    
    // List of month names
    List<String> monthNames = [
      'january', 'february', 'march', 'april', 'may', 'june',
      'july', 'august', 'september', 'october', 'november', 'december'
    ];

    // Regular expression to extract year, expecting a 4-digit number
    final yearRegExp = RegExp(r'\b(19|20)\d{2}\b');
    final yearMatch = yearRegExp.firstMatch(formattedText);
    int spokenYear = DateTime.now().year; // Default to current year
    
    // If year is found, parse it
    if (yearMatch != null) {
      spokenYear = int.parse(yearMatch.group(0)!);
    }

    // Loop through month names to find the spoken month
    for (int i = 0; i < monthNames.length; i++) {
      if (formattedText.contains(monthNames[i])) {
        String spokenMonth = (i + 1).toString().padLeft(2, '0'); // Ensure month is two digits

        // Regular expression to extract the day (1 or 2 digit number)
        final dayRegExp = RegExp(r'\b\d{1,2}\b');
        final dayMatch = dayRegExp.firstMatch(formattedText);
        
        if (dayMatch != null) {
          String spokenDay = dayMatch.group(0)!.padLeft(2, '0'); // Ensure day is two digits

          // Construct a full date string and parse it
          String dateString = '$spokenMonth $spokenDay $spokenYear';
          return DateFormat('MM dd yyyy').parseLoose(dateString);
        }
      }
    }
  } catch (e) {
    debugPrint('Error in custom date parsing: $e');
  }

  return null; // Return null if parsing fails
}
}

// BLoC states
abstract class DatePickerState {}

/* 
  Initial state when the BLoC is first created.
*/
class DatePickerInitial extends DatePickerState {}

/* 
  State indicating that the speech recognition is currently listening.
*/
class DatePickerListening extends DatePickerState {}

/* 
  State indicating that the speech recognition is not listening.
*/
class DatePickerNotListening extends DatePickerState {}

/* 
  State representing the successful update of the date.
  Contains the updated DateTime.
*/
class DatePickerDateUpdated extends DatePickerState {
  final DateTime date;
  DatePickerDateUpdated(this.date);
}

/* 
  State representing an error, with an error message.
*/
class DatePickerError extends DatePickerState {
  final String message;
  DatePickerError(this.message);
}
