import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppClick extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onDoubleTap;
  final GestureTapCallback? onSecondaryTap;

  const AppClick(
      {required this.child,
      this.onDoubleTap,
      this.onSecondaryTap,
      this.onLongPress,
      this.onTap,
      super.key});

  @override
  State<AppClick> createState() => _AppClickState();
}

class _AppClickState extends State<AppClick> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      onSecondaryTap: widget.onSecondaryTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: widget.child
          .animate(target: _isPressed ? 1 : 0)
          .scaleXY(begin: 1, end: 0.95, duration: 100.ms, curve: Curves.linear)
          .fade(begin: 1.0, end: 0.85, duration: 100.ms, curve: Curves.linear),
    );
  }
}
