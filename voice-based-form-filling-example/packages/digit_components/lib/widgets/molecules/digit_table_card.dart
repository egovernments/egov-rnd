import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitTableCard extends StatelessWidget {
  final Map<String, dynamic> element;
  final Border? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double gap;
  final num fraction;
  final EdgeInsetsGeometry? topPadding;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;

  const DigitTableCard({
    super.key,
    required this.element,
    this.border,
    this.color,
    this.padding,
    this.gap = 0,
    this.fraction = 1.8,
    this.topPadding,
    this.labelStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: topPadding ?? const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: border),
        child: Padding(
          padding: padding ?? const EdgeInsets.only(bottom: 8),
          child: Column(
            children: element.keys
                .map((e) => Container(
                      margin: DigitTheme.instance.verticalMargin,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / fraction,
                            child: Text(
                              e,
                              style:
                                  labelStyle ?? theme.textTheme.headlineSmall,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(width: gap),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 1.4),
                            child: Text(
                              element[e].toString(),
                              style: descriptionStyle,
                            ),
                          )),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
