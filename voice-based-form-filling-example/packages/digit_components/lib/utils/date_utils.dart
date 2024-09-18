import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DigitDateUtils {
  // Function to calculate age in years and months based on the selected date.
  static DigitDOBAge calculateAge(DateTime? selectedDate) {
    if (selectedDate == null) {
      return DigitDOBAge();
    } else {
      DateTime currentDate = DateTime.now();

      // Calculate the difference in years, months, and days
      int ageInYears = currentDate.year - selectedDate.year;
      int ageInMonths = currentDate.month - selectedDate.month;
      int ageInDays = currentDate.day - selectedDate.day;

      // If the current day is earlier than the selected day in the same month,
      // reduce the month count and adjust the days accordingly.
      if (ageInDays < 0) {
        ageInMonths--;
        ageInDays += DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
      }

      // If the current month is earlier than the selected month, reduce the year count
      // and adjust the month and day counts accordingly.
      if (ageInMonths < 0) {
        ageInYears--;
        ageInMonths += 12;
      }

      return DigitDOBAge(
          years: ageInYears >= 0 ? ageInYears : 0,
          months: ageInMonths,
          days: ageInDays);
    }
  }

  // Function to get a formatted date string based on the provided date string and date format.
  static getFilteredDate(String date, {String? dateFormat}) {
    if (date.trim().isEmpty) return '';
    try {
      var dateTime = DateTime.parse(date).toLocal();
      return DateFormat(dateFormat ?? "dd/MM/yyyy").format(dateTime);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static bool isLeapYear(int year) {
    // A year is a leap year if it's divisible by 4 but not divisible by 100,
    // or if it's divisible by 400.
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  static int yearsToDays(int years) {
    int days = 0;
    for (int year = 0; year < years; year++) {
      days += isLeapYear(year) ? 366 : 365;
    }
    return days;
  }

  static int yearsMonthsDaysToDays(int years, int months, int days) {
    int totalDays = 0;

    // Convert years to days
    for (int year = 0; year < years; year++) {
      totalDays += isLeapYear(year) ? 366 : 365;
    }

    // Convert months to days
    for (int month = 0; month < months; month++) {
      totalDays += DateTime(DateTime.now().year, month + 2, 0).day;
    }

    // Add the given days to the total
    totalDays += days;

    return totalDays;
  }

  // Function to parse the provided date string and return a DateTime object.
  static DateTime? getFormattedDateToDateTime(String date) {
    try {
      DateFormat inputFormat;
      inputFormat = date.contains('-')
          ? DateFormat('dd-MM-yyyy')
          : DateFormat('dd/MM/yyyy');
      DateTime inputDate = inputFormat.parse(date);

      return inputDate;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }

  // Function to get a formatted date string from the provided timestamp in milliseconds.
  static String getDateFromTimestamp(int timestamp, {String? dateFormat}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(dateFormat ?? "dd/MM/yyyy").format(date);
  }

  // Function to get time from timestamp.
  static String getTimeFromTimestamp(int timestamp,
      {bool is24HourFormat = false}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return is24HourFormat
        ? DateFormat('HH:mm').format(date)
        : DateFormat('hh:mm a').format(date);
  }

  // Function to convert a date string to a timestamp in milliseconds.
  static int dateToTimeStamp(String dateTime) {
    try {
      return getFormattedDateToDateTime(dateTime)!
          .toUtc()
          .millisecondsSinceEpoch;
    } catch (e) {
      return 0;
    }
  }

  // Function to get the number of years or months between a provided date and the current date.
  static getYearsAndMonthsFromDateTime(
    DateTime dateTime, [
    bool getMonths = false,
  ]) {
    int days = DateTime.now().difference(dateTime).inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;

    return getMonths ? months : years;
  }

  // Function to convert a timestamp to a formatted date string based on the provided format.
  static String timeStampToDate(int? timeInMillis, {String? format}) {
    if (timeInMillis == null) return '';
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      return DateFormat(format ?? 'dd/MM/yyyy').format(date);
    } catch (e) {
      return e.toString();
    }
  }

  // Function to get the abbreviated month name from the provided date.
  static String getMonth(DateTime date) {
    try {
      return DateFormat.MMM().format(date);
    } catch (e) {
      return '';
    }
  }

  // Function to get the abbreviated day name from the provided timestamp in milliseconds.
  static String getDay(int timeInMillis) {
    try {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
      return DateFormat.E().format(date);
    } catch (e) {
      return '';
    }
  }
}

class DigitDOBAge {
  final int years;
  final int months;
  final int days;

  DigitDOBAge({this.years = 0, this.months = 0, this.days = 0});
}
