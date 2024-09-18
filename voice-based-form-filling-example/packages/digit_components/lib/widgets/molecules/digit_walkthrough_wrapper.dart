import 'package:flutter/material.dart';
import 'package:overlay_builder/overlay_builder.dart';

import 'digit_walkthrough.dart';

class DigitWalkthroughWrapper extends StatefulWidget {
  final Widget child;
  final int initialIndex;
  final List<GlobalKey> keysArray;
  final GlobalKey<OverlayWidgetState> overlayWidget;
  final List<GlobalKey<DigitWalkthroughState>> widgetKey;

  const DigitWalkthroughWrapper({
    super.key,
    required this.child,
    required this.overlayWidget,
    required this.keysArray,
    required this.widgetKey,
    required this.initialIndex,
  });
  @override
  State<StatefulWidget> createState() {
    return DigitWalkthroughWrapperState();
  }
}

class DigitWalkthroughWrapperState extends State<DigitWalkthroughWrapper> {
  int index = 0;
  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  bool showOverlay = false;
  GlobalKey<OverlayWidgetState> overlaykey =
      GlobalKey(debugLabel: 'Digit-Wrapper');

  OverlayWidgetState? get overlayWidgetController {
    return widget.overlayWidget.currentState;
  }

  void onSelectedTap() {
    if (widget.keysArray.length == index) {
      widget.widgetKey[index - 1].currentState?.onButtonTap();
      widget.widgetKey[index - 1].currentState?.setState(() {
        widget.widgetKey[index - 1].currentState?.showROverlay = false;
      });

      setState(() {
        index = widget.initialIndex;
      });
    } else {
      if (index > widget.initialIndex) {
        widget.widgetKey[index - 1].currentState?.setState(() {
          widget.widgetKey[index - 1].currentState?.showROverlay = false;
        });
        widget.widgetKey[index - 1].currentState?.onButtonTap();
      }

      widget.widgetKey[index].currentState?.setState(() {
        widget.widgetKey[index].currentState?.showROverlay = false;
      });
      widget.widgetKey[index].currentState?.onButtonTap();
      widget.widgetKey[index].currentState?.setState(() {
        widget.widgetKey[index].currentState?.showROverlay = true;
      });
      setState(() {
        index = index + 1;
      });
    }
  }

  void onSelectedSkip() {
    widget.widgetKey[index - 1].currentState?.setState(() {
      widget.widgetKey[index - 1].currentState?.showROverlay = false;
    });
    widget.widgetKey[index - 1].currentState?.onButtonTap();
    setState(() {
      index = widget.initialIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      opaque: true,
      type: OverlayType.fullscreen,
      key: overlaykey,
      overlayChild: widget.child,
      child: Material(
          elevation: 6,
          type: MaterialType.transparency,
          child: IgnorePointer(
            ignoring: index > widget.initialIndex,
            child: widget.child,
          )),
    );
  }
}
