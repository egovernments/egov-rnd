import 'package:digit_components/widgets/atoms/anchor_overlay.dart';
import 'package:flutter/material.dart';
import 'package:overlay_builder/overlay_builder.dart';

class DigitWalkthrough extends StatefulWidget {
  final Widget child;
  final String? title;
  final String skipLabel;
  final String nextLabel;
  final GlobalKey<OverlayWidgetState> overlayWidget;
  final TextAlign titleAlignment;
  final String description;
  final VoidCallback onTap;

  final VoidCallback onSkip;
  final double widgetHeight;

  const DigitWalkthrough({
    super.key,
    required this.child,
    required this.overlayWidget,
    this.title,
    required this.titleAlignment,
    required this.description,
    required this.onTap,
    required this.onSkip,
    required this.widgetHeight,
    required this.skipLabel,
    required this.nextLabel,
  });

  @override
  State<DigitWalkthrough> createState() => DigitWalkthroughState();
}

class DigitWalkthroughState extends State<DigitWalkthrough> {
  bool showROverlay = false;
  double childHeight = 0.0;
  double childWidth = 0.0;
  Offset position = Offset.zero;

  OverlayWidgetState? get overlayFullscreenController {
    return widget.overlayWidget.currentState;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initOffsetsPositions();
    });
  }

  void initOffsetsPositions() {
    Offset position =
        ((widget.overlayWidget).currentContext?.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);
    childHeight = (widget.overlayWidget).currentContext!.size!.height / 2;
    childWidth = (widget.overlayWidget).currentContext!.size!.width;

    this.position = position;
  }

  void onButtonTap() {
    overlayFullscreenController?.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.widgetHeight,
      child: GestureDetector(
          onTap: () => initOffsetsPositions(),
          child: AnchoredOverlay(
              showOverlay: showROverlay,
              description: widget.description,
              paramKey: widget.overlayWidget,
              onTap: widget.onTap,
              onSkip: widget.onSkip,
              position: position,
              childHeight: childHeight,
              childWidth: childWidth,
              skipLabel: widget.skipLabel,
              nextLabel: widget.nextLabel,
              child: IgnorePointer(
                ignoring: showROverlay,
                child: widget.child,
              ))),
    );
  }
}
