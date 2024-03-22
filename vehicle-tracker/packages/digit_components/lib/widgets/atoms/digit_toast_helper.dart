import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';

class ToastHelper extends StatefulWidget {
  final String message;

  const ToastHelper({
    super.key,
    required this.message,
  });

  @override
  State<StatefulWidget> createState() {
    return ToastHelperState();
  }
}

class ToastHelperState extends State<ToastHelper> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final theme = Theme.of(context);
      DigitToast.show(
        context,
        options: DigitToastOptions(widget.message, true, theme),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
