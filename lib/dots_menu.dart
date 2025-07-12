import 'dart:ui';

import 'package:flutter/material.dart';

class DotsMenuIcon {
  const DotsMenuIcon({this.onTap, required this.child, this.backgroudColor});

  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroudColor;
}

class DotsMenu extends StatefulWidget {
  static const directionDefault = Axis.horizontal;
  static const durationDefault = Duration(milliseconds: 200);

  static const dotSpacingDefault = 2.0;
  static const dotSizeDefault = 6.0;
  static const dotColorDefault = Colors.black;

  static const iconSpacingDefault = 4.0;
  static const childPaddingDefault = 6.0;
  static const childSizeDefault = 28.0;
  static const childBackgroudColorDefault = Color(0xFFD6D6D6);

  static const curveDefault = Curves.easeIn;

  const DotsMenu({
    super.key,
    required this.onTap,
    required this.expanded,
    required this.items,
    this.direction = directionDefault,
    this.duration = durationDefault,
    this.dotSpacing = dotSpacingDefault,
    this.dotSize = dotSizeDefault,
    this.dotColor = dotColorDefault,
    this.childSpacing = iconSpacingDefault,
    this.childPadding = childPaddingDefault,
    this.childSize = childSizeDefault,
    this.childBackgroudColor = childBackgroudColorDefault,
    this.curve = curveDefault,
  });

  final VoidCallback onTap;
  final bool expanded;

  final List<DotsMenuIcon> items;

  final Axis direction;
  final Duration duration;

  final double dotSpacing;
  final double dotSize;
  final Color dotColor;

  final double childSpacing;
  final double childPadding;
  final double childSize;
  final Color childBackgroudColor;

  final Curve curve;

  @override
  State<DotsMenu> createState() => _DotsMenuState();
}

class _DotsMenuState extends State<DotsMenu>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOutCubicEmphasized,
  );

  @override
  void didUpdateWidget(covariant DotsMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expanded != oldWidget.expanded) {
      if (widget.expanded) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DotsMenu(:direction, :expanded, :onTap, :items) = widget;

    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: expanded ? null : onTap,
      child: Material(
        child: Flex(
          direction: direction,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < items.length; i++)
              _buildItem(items[i], i == items.length - 1),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(DotsMenuIcon item, bool isLast) {
    final borderRadius = BorderRadius.circular(100);

    final DotsMenu(
      :expanded,
      :dotColor,
      :dotSize,
      :dotSpacing,
      :childBackgroudColor,
      :childPadding,
      :childSize,
      childSpacing:iconSpacing,
      :direction,
    ) = widget;

    return AnimatedBuilder(
      // animation: animationController,
      // builder: (context, _) {
      //   final value = animationController.value;
      animation: animation,
      builder: (context, _) {
        final value = animation.value;

        final spacing = lerpDouble(dotSpacing, iconSpacing, value)!;

        return Padding(
          padding: isLast
              ? EdgeInsets.zero
              : EdgeInsets.only(
                  right: direction == Axis.horizontal ? spacing : 0,
                  bottom: direction == Axis.vertical ? spacing : 0,
                ),
          child: InkWell(
            borderRadius: borderRadius,
            onTap: expanded ? item.onTap : null,
            hoverColor: Colors.transparent,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Color.lerp(
                  dotColor,
                  item.backgroudColor ?? childBackgroudColor,
                  value,
                ),
              ),
              child: SizedBox.square(
                dimension: (value * (childSize - dotSize)) + dotSize,
                child: Padding(
                  padding: EdgeInsets.all(value * childPadding),
                  child: Transform.scale(
                    scale: value,
                    child: FittedBox(child: item.child),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
