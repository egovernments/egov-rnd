import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

Widget textColumnWidget(List<String> values, DigitTheme theme) => Padding(
      padding: theme.verticalMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText('Trip ID', bold: true),
              paddedText('Name', bold: true),
              paddedText('Vehicle Number', bold: true),
              paddedText("Pickup Location", bold: true),
              paddedText("Drop Location", bold: true),
              paddedText("Date", bold: true),
              paddedText("Status", bold: true)
            ],
          ),
          const Spacer(),
          Column(
            children: [
              paddedText(values[0]),
              paddedText(values[0]),
              paddedText(values[0]),
              paddedText(values[0]),
              paddedText(values[0]),
              paddedText(values[0]),
              paddedText(values[0]),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );

Widget paddedText(String value, {bool bold = false}) => Padding(
      padding: DigitTheme.instance.verticalMargin,
      child: Text(
        value,
        style: bold ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ),
    );
