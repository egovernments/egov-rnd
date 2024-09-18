import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const DigitElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kPadding,
        bottom: kPadding,
      ),
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DigitTheme.instance.colors.woodsmokeBlack,
            width: 2,
          ),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
