import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class TripInfoWidget extends StatelessWidget {
  const TripInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  final String title;
  final String description;
  final bool isCompleted;

  final DigitColors digitColors = const DigitColors();

  @override
  Widget build(BuildContext context) {
    return DigitInfoCard(
      title: title,
      description: description,
      backgroundColor: isCompleted ? digitColors.darkSpringGreen : digitColors.lavaRed,
      icon: Icons.check_circle,
      iconColor: digitColors.white,
    );
  }
}
