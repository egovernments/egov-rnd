import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

class DigitSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final Widget? icon;

  const DigitSearchBar({
    super.key,
    this.controller,
    this.padding,
    this.margin,
    this.hintText,
    this.contentPadding,
    this.borderRadius,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.scaffoldBackgroundColor, width: 1),
        borderRadius: BorderRadius.circular(
            borderRadius != null ? (borderRadius! * 3) : 30),
      ),
      margin: margin,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(kPadding),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          inputFormatters: [
            RemoveEmojiInputFormatter(),
          ],
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            icon: icon ??
                const Icon(
                  Icons.search,
                  size: 24,
                ),
            border: InputBorder.none,
            hintText: hintText ?? 'Enter the field details',
            filled: true,
            fillColor: theme.cardColor,
            contentPadding: contentPadding ??
                const EdgeInsets.only(
                  left: 16.0,
                  bottom: 8.0,
                  top: 8.0,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              borderSide: BorderSide(color: theme.cardColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: theme.scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            ),
          ),
        ),
      ),
    );
  }
}
