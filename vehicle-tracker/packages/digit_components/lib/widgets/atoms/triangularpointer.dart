import 'package:flutter/material.dart';

class TriangularShape extends StatelessWidget {
  const TriangularShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: TriangularBorder(),
      child: ClipPath(
        clipper: TriangularClipper(),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: 40,
          width: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class TriangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TriangularBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.moveTo(rect.width / 2, 0);
    path.lineTo(0, rect.height);
    path.lineTo(rect.width, rect.height);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
  @override
  ShapeBorder scale(double t) => TriangularBorder();
}
