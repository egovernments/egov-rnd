import 'package:flutter/material.dart';

class DigitSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;

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
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? 'Enter the field details',
            filled: true,
            fillColor: theme.cardColor,
            contentPadding: contentPadding ??
                const EdgeInsets.only(
                  left: 14.0,
                  bottom: 6.0,
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
