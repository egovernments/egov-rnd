import 'package:digit_components/theme/colors.dart';
import 'package:flutter/material.dart';

/*A single checkbox component */
class CheckboxIcon extends StatelessWidget {
  final bool value;

  // Constructor for the DigitCheckbox widget with required parameters
  const CheckboxIcon({
    super.key,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: value
              ? const DigitColors().burningOrange
              : const DigitColors().davyGray,
          width: 2.0,
        ),
        borderRadius: BorderRadius.zero,
      ),
      child: value
          ? Center(
              child: Icon(
                Icons.check,
                size: 16.0,
                color: const DigitColors().burningOrange,
              ),
            )
          : null,
    );
  }
}
