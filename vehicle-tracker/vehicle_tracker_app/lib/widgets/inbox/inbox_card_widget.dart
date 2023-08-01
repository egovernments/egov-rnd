import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class InboxCardWidget extends StatelessWidget {
  const InboxCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        children: [
          _textRow("Application No", "3t4354y7"),
          _textRow("Applicant Date", "6/7/2023"),
          _textRow("Locality", "Preet Nagar"),
          _textRow("Status", "DSO Rejected"),
          _textRow("SLA Days Reamining", "-1", isSLA: true),
        ],
      ),
    );
  }
}

Widget _textRow(String a, b, {bool isSLA = false}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(a, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(b, maxLines: 3, style: isSLA ? const TextStyle(color: Colors.red) : null),
        ],
      ),
    );
