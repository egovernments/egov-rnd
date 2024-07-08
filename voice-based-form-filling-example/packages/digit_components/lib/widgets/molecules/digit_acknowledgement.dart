import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitAcknowledgement extends StatelessWidget {
  final String label;
  final String? subLabel;
  final String? description;
  final Widget? descriptionWidget;
  final IconData icon;
  final VoidCallback? action;
  final String? actionLabel;
  final Color color;
  final bool enableBackToSearch;
  final bool enableViewHousehold;
  final VoidCallback? secondaryAction;
  final String? secondaryLabel;
  final bool isActionLabel;

  DigitAcknowledgement.success({
    super.key,
    required this.label,
    this.subLabel,
    this.description,
    this.descriptionWidget,
    this.action,
    this.actionLabel,
    IconData? icon,
    Color? color,
    this.enableBackToSearch = true,
    this.enableViewHousehold = false,
    this.secondaryAction,
    this.secondaryLabel,
    this.isActionLabel = true,
  })  : color = color ?? DigitTheme.instance.colors.darkSpringGreen,
        icon = icon ?? Icons.check_circle;

  DigitAcknowledgement.error({
    super.key,
    required this.label,
    this.subLabel,
    required this.description,
    required this.action,
    required this.actionLabel,
    IconData? icon,
    Color? color,
    this.enableBackToSearch = true,
    this.enableViewHousehold = false,
    this.secondaryAction,
    this.secondaryLabel,
    this.isActionLabel = true,
    this.descriptionWidget,
  })  : color = color ?? DigitTheme.instance.colors.lavaRed,
        icon = icon ?? Icons.error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScrollableContent(
      children: [
        DigitCard(
          padding: EdgeInsets.zero,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2,
                vertical: kPadding * 4,
              ),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 3,
              ),
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    label,
                    style: TextStyle(
                      fontSize: theme.textTheme.displayMedium?.fontSize,
                      fontWeight: theme.textTheme.displayMedium?.fontWeight,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: kPadding * 2.5,
                      right: kPadding * 2,
                      top: kPadding * 2,
                      bottom: kPadding * 2,
                    ),
                    child: Icon(
                      icon,
                      size: 32,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  if (subLabel != null) ...[
                    Text(
                      textAlign: TextAlign.center,
                      subLabel!,
                      style: TextStyle(
                        fontSize: theme.textTheme.headlineLarge?.fontSize,
                        fontWeight: theme.textTheme.headlineLarge?.fontWeight,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ],
              ),
            ),
            Padding(
              padding: DigitTheme.instance.containerMargin,
              child: Align(
                alignment: Alignment.centerLeft,
                child: descriptionWidget ??
                    Text(
                      description ?? '',
                      style: theme.textTheme.bodyMedium,
                    ),
              ),
            ),
            if (enableBackToSearch)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  kPadding,
                  kPadding,
                  kPadding,
                  kPadding * 2,
                ),
                child: Column(
                  children: [
                    if (enableViewHousehold)
                      Column(
                        children: [
                          DigitElevatedButton(
                              onPressed: secondaryAction,
                              child: Text(secondaryLabel ?? "")),
                          const SizedBox(
                            height: kPadding + 2,
                          ),
                          DigitOutLineButton(
                              onPressed: action,
                              label: actionLabel ?? '',
                              buttonStyle: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  width: 1.0,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width / 1,
                                  50,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                        ],
                      )
                    else if (isActionLabel)
                      Column(
                        children: [
                          DigitElevatedButton(
                              onPressed: action,
                              child: Text(actionLabel ?? ''),
                            ),
                          const SizedBox(
                            height: kPadding,
                          ),
                        ],
                      )
                  ],
                ),
              )
          ]),
        ),
      ],
    );
  }
}
