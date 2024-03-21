import 'package:flutter/material.dart';
import './triangularpointer.dart';
import 'package:digit_components/digit_components.dart';
import 'package:overlay_builder/overlay_builder.dart';

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget child;
  final String description;
  final GlobalKey paramKey;
  final VoidCallback onTap;
  final Offset position;
  final double childHeight;

  const AnchoredOverlay(
      {super.key,
      required this.showOverlay,
      required this.child,
      required this.description,
      required this.paramKey,
      required this.onTap,
      required this.position,
      required this.childHeight});

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      type: OverlayType.fullscreen,
      opaque: false,
      key: paramKey,
      overlayChild: GestureDetector(
          onTap: onTap,
          child: Stack(children: [
            Positioned(
              top: position.dy + childHeight - 20,
              left: 100,
              child: const TriangularShape(),
            ),
            Positioned(
                top: position.dy + childHeight,
                child: Card(
                    elevation: 10,
                    margin: DigitTheme.instance.containerMargin,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      height: 30, //height of button
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Skip',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      )),
                                  SizedBox(
                                      height: 30, //height of button
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          //content padding inside button
                                        ),
                                        onPressed: onTap,
                                        child: const Text(
                                          'Next',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ))
                                ])
                          ],
                        ))))
          ])),
      child: showOverlay
          ? Scaffold(
              body: GestureDetector(
              onTap: onTap,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                child: Material(
                  elevation: 6,
                  type: MaterialType.transparency,
                  child: child,
                ),
              ),
            ))
          : GestureDetector(
              onTap: onTap,
              child: SizedBox(
                height: childHeight,
                child: child,
              )),
    );
  }
}
