import 'package:flutter/material.dart';

class ScrollableContent extends StatelessWidget {
  final Widget? header;
  final Widget? footer;
  final List<Widget> slivers;
  final bool? primary;
  final ScrollController? controller;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const ScrollableContent({
    super.key,
    this.footer,
    this.header,
    this.primary,
    this.controller,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.children = const <Widget>[],
    this.slivers = const [],
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      primary: primary,
      slivers: [
        if (header != null) SliverToBoxAdapter(child: header),
        ...slivers,
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: mainAxisAlignment,
                    children: children,
                  ),
                ),
                if (footer != null) ...[
                  const SizedBox(height: 16),
                  footer!,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
