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
      builder: (context) => PopScope(
        canPop: options.barrierDismissible,
        child: DigitDialog(
          key: options.key,
          options: options,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Padding(
          padding: options.dialogPadding != null
              ? options.dialogPadding!
              : const EdgeInsets.all(kPadding),
          child: options.title,
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: kPadding),
            child: options.content,
          ),
        ),
        scrollable: options.isScrollable,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          if (options.enableRecordPast == true)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  if (options.secondaryAction != null)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: DigitOutLineButton(
                        onPressed: () =>
                            options.secondaryAction!.action?.call(context),
                        label: options.secondaryAction!.label,
                        buttonStyle: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width / 4, 50),
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (options.primaryAction != null)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: DigitElevatedButton(
                        onPressed: () =>
                            options.primaryAction!.action?.call(context),
                        child:
                            Center(child: Text(options.primaryAction!.label)),
                      ),
                    )
                ],
              ),
            )
          else
            Column(
              children: <Widget>[
                if (options.primaryAction != null)
                  DigitElevatedButton(
                    onPressed: () =>
                        options.primaryAction!.action?.call(context),
                    child: Center(child: Text(options.primaryAction!.label)),
                  ),
                if (options.secondaryAction != null)
                  TextButton(
                    onPressed: () =>
                        options.secondaryAction!.action?.call(context),
                    child: Center(child: Text(options.secondaryAction!.label)),
                  ),
              ],
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
  final bool isScrollable;
  final Key? key;
  final bool? enableRecordPast;
  final EdgeInsets? dialogPadding;

  const DigitDialogOptions({
    this.titleText,
    this.contentText,
    this.titleIcon,
    Widget? title,
    Widget? content,
    this.primaryAction,
    this.secondaryAction,
    this.barrierDismissible = false,
    this.enableRecordPast = false,
    this.isScrollable = false,
    this.titlePadding = const EdgeInsets.only(
      top: kPadding,
      bottom: kPadding,
    ),
    this.contentPadding = const EdgeInsets.all(kPadding),
    this.barrierColor,
    this.key,
    this.dialogPadding,
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
              style: DigitTheme.instance.mobileTheme.textTheme.headlineMedium,
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
