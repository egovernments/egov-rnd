import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DigitTheme.instance.buttonPadding,
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Center(
            child: DigitIconButton(
              icon: Icons.camera_alt_outlined,
              iconText: "Click to add photo",
              onPressed: () => (),
            ),
          ),
        ),
      ),
    );
  }
}
