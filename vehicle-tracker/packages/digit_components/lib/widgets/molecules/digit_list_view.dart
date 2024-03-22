import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitListView extends StatelessWidget {
  final IconData? prefixIcon;
  final String title;
  final String? description;
  final IconData? sufixIcon;
  final VoidCallback? onPressed;

  const DigitListView(
      {super.key,
      this.prefixIcon,
      required this.title,
      this.description,
      this.sufixIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigitCard(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          prefixIcon,
                          color: theme.colorScheme.secondary,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          title,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    Offstage(
                      offstage: description == null,
                      child: Text(description!),
                    ),
                  ],
                )),
            Icon(
              sufixIcon,
              color: theme.colorScheme.secondary,
              size: 36,
            ),
          ],
        ));
  }
}
