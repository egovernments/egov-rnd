import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';

class DigitRowCard extends StatelessWidget {
  final List<DigitRowCardModel> rowItems;
  final ValueChanged<DigitRowCardModel>? onChanged;
  final double width;

  const DigitRowCard({
    super.key,
    this.onChanged,
    required this.rowItems,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowItems
          .map(
            (e) => SizedBox(
              height: 38,
              width: width,
              child: GestureDetector(
                onTap: () => onChanged?.call(e),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: e.isSelected
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.onBackground,
                    ),
                    color: e.isSelected
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.onSecondary,
                  ),
                  child: Center(
                    child: Text(
                      e.label,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: e.isSelected
                            ? theme.colorScheme.onSecondary
                            : theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
