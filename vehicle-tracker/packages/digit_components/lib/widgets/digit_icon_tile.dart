import 'package:flutter/material.dart';

class DigitIconTile extends StatelessWidget {
  final String title;
  final Widget? content;
  final IconData? icon;
  final VoidCallback onPressed;

  const DigitIconTile({
    super.key,
    required this.title,
    this.content,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16,
      leading: Icon(
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
