import 'package:flutter/material.dart';

class DigitIconTile extends StatelessWidget {
  final String title;
  final Widget? content;
  final IconData? icon;
  final ImageIcon? imageIcon;
  final VoidCallback onPressed;
  final bool? selected;

  const DigitIconTile({
    super.key,
    required this.title,
    this.content,
    this.icon,
    this.imageIcon,
    this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16,
      selected: selected ?? false,
      leading: imageIcon ??
          Icon(
            icon,
            color: Theme.of(context).colorScheme.shadow,
          ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
          ),
          content ?? const Offstage()
        ],
      ),
      onTap: onPressed,
    );
  }
}
