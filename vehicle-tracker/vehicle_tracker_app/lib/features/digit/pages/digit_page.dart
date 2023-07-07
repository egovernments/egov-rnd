import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_tracker_app/themes.dart';

class DigitPage extends StatelessWidget {
  const DigitPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool check = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Digit Page'),
      ),
      body: Column(
        children: [
          // ElevatedButton
          DigitElevatedButton(
            child: const Text("Check"),
            onPressed: () => showToast(context, "Hello World"),
          ),

          // Outline Button
          DigitOutLineButton(
            label: "Outline Button",
            onPressed: () => showToast(context, "Hello World 1"),
          ),

          // IconButton
          DigitIconButton(
            icon: Icons.add,
            onPressed: () => showToast(context, "Hello World 3"),
            iconColor: Colors.red,
            iconText: "Add",
            iconTextColor: Colors.red,
          ),

          // Outline IconButton
          DigitOutlineIconButton(
            label: "Outline Add",
            icon: Icons.add,
            onPressed: () => showToast(context, "Hello World 4"),
          ),

          // Text Field
          const DigitTextField(
            label: "Text Field",
          ),

          // Text Box
          DigitCheckbox(
            label: "Checkbox",
            value: check,
            onChanged: (value) {
              check = !value!;
            },
          ),

          // info card
          const DigitInfoCard(
            title: "Info Card",
            description: "This is a info card",
          ),

          const Spacer(),
          const DigitDivider(),
          const PoweredByDigit(),
        ],
      ),
    );
  }
}

showToast(BuildContext context, String message) {
  DigitToast.show(context, options: DigitToastOptions(message, false, CustomTheme.toastTheme));
}
