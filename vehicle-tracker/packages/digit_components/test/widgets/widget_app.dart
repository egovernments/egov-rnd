import 'package:flutter/material.dart';

class WidgetApp extends StatelessWidget {
  final Widget child;
  final NavigatorObserver? navigatorObserver;

  const WidgetApp({
    super.key,
    required this.child,
    this.navigatorObserver,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorObservers: [if (navigatorObserver != null) navigatorObserver!],
        home: Scaffold(body: child),
      );
}
