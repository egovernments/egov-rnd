import 'package:flutter/material.dart';

class DigitDivider extends StatelessWidget {
  const DigitDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      key: const ValueKey('neo_divider'),
      color: Theme.of(context).colorScheme.outline,
      height: 1.0,
    );
  }
}
