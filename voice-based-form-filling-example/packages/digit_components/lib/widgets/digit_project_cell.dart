import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitProjectCell extends StatelessWidget {
  final VoidCallback onTap;
  final String projectText;

  const DigitProjectCell({
    super.key,
    required this.projectText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DigitCard(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.article,
                    size: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            projectText,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
