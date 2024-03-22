import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitDialog extends StatelessWidget {
  final DigitDialogOptions options;

  const DigitDialog({
    super.key,
    required this.options,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required DigitDialogOptions options,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: options.barrierDismissible,
      barrierColor: options.barrierColor ??
          DigitTheme.instance.colors.black.withOpacity(0.7),
      builder: (context) => DigitDialog(
        key: options.key,
        options: options,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: options.title,
        content: options.content,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          if (options.primaryAction != null)
            DigitElevatedButton(
              onPressed: () => options.primaryAction!.action?.call(context),
              child: Center(child: Text(options.primaryAction!.label)),
            ),
          if (options.secondaryAction != null)
            TextButton(
              onPressed: () => options.secondaryAction!.action?.call(context),
              child: Center(child: Text(options.secondaryAction!.label)),
            ),
        ],
        titlePadding: options.titlePadding,
        contentPadding: options.contentPadding,
      );
}

class DigitDialogOptions {
  final Icon? titleIcon;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final String? titleText;
  final String? contentText;
  final Widget? _titleWidget;
  final Widget? _contentWidget;
  final DigitDialogActions? primaryAction;
  final DigitDialogActions? secondaryAction;
  final bool barrierDismissible;
  final Color? barrierColor;
  final Key? key;

  const DigitDialogOptions({
    this.titleText,
    this.contentText,
    this.titleIcon,
    Widget? title,
    Widget? content,
    this.primaryAction,
    this.secondaryAction,
    this.barrierDismissible = false,
    this.titlePadding = const EdgeInsets.all(kPadding),
    this.contentPadding = const EdgeInsets.all(kPadding),
    this.barrierColor,
    this.key,
  })  : _titleWidget = title,
        _contentWidget = content;

  Widget? get title {
    if (_titleWidget != null) return _titleWidget;
    if (titleText != null) {
      return Row(
        children: [
          if (titleIcon != null) ...[
            titleIcon!,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              titleText!,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    }
    return null;
  }

  Widget? get content {
    if (_contentWidget != null) return _contentWidget;
    if (contentText != null) {
      return Text(
        contentText!,
        textAlign: TextAlign.left,
      );
    }
    return null;
  }
}

class DigitDialogActions<T> {
  final String label;
  final T Function(BuildContext context)? action;

  const DigitDialogActions({
    required this.label,
    this.action,
  });
}
