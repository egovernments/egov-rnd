import 'package:flutter/material.dart';

class DigitBanner extends StatelessWidget {
  final Widget child;
  final Color color;
  final String imageUrl;
  final double height;

  const DigitBanner({
    super.key,
    required this.child,
    required this.color,
    required this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
          opacity: .2,
        ),
      ),
      child: child,
    );
  }
}
