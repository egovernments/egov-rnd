import 'package:digit_components/widgets/atoms/anchor_overlay.dart';
import 'package:flutter/material.dart';
import 'package:overlay_builder/overlay_builder.dart';

class DigitWalkthrough extends StatefulWidget {
  final Widget child;
  final String? title;
  final GlobalKey<OverlayWidgetState> overlayWidget;
  final TextAlign titleAlignment;
  final String description;

  const DigitWalkthrough(
      {super.key,
      required this.child,
      required this.overlayWidget,
      this.title,
      required this.titleAlignment,
      required this.description});

  @override
  State<DigitWalkthrough> createState() => _DigitWalkthroughState();
}

class _DigitWalkthroughState extends State<DigitWalkthrough> {
  final _overlayFullscreen = GlobalKey<OverlayWidgetState>();
  bool showOverlay = false;
  late double childHeight;
  late Offset position;

  _DigitWalkthroughState();
  OverlayWidgetState? get overlayWidgetController {
    return widget.overlayWidget.currentState;
  }

  OverlayWidgetState? get overlayFullscreenController {
    return _overlayFullscreen.currentState;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initOffsetsPositions();
    });
  }

  void initOffsetsPositions() {
    Offset position = ((widget.child.key as GlobalKey)
            .currentContext
            ?.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
    childHeight = (widget.child.key as GlobalKey).currentContext!.size!.height;
    this.position = position;
  }

  void onTap() {
    setState(() {
      showOverlay = !showOverlay;
    });
    overlayWidgetController?.toggle();
    overlayFullscreenController?.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
        showOverlay: showOverlay,
        description: widget.description,
        paramKey: widget.overlayWidget,
        onTap: onTap,
        position: position,
        childHeight: childHeight,
        child: widget.child);
  }
}
