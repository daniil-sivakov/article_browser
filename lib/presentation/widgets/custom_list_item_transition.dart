import 'dart:async';

import 'package:flutter/material.dart';

class CustomListItemTransition extends StatefulWidget {
  const CustomListItemTransition({
    super.key,
    required this.runBackwards,
    required this.runAnimationAfter,
    required this.child,
  });

  final bool runBackwards;
  final DateTime runAnimationAfter;
  final Widget child;

  @override
  State<CustomListItemTransition> createState() =>
      _CustomListItemTransitionState();
}

class _CustomListItemTransitionState extends State<CustomListItemTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  Timer? _fireAnimationTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rescheduleFireAnimationTimer();
  }

  @override
  void didUpdateWidget(covariant CustomListItemTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.runBackwards != widget.runBackwards) {
      widget.runBackwards
          ? _animationController.reverse()
          : _animationController.forward();
    }

    _rescheduleFireAnimationTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOutExpo,
        ),
      ),
      child: widget.child,
    );
  }

  void _rescheduleFireAnimationTimer() {
    if (widget.runBackwards) return;

    Duration delay = widget.runAnimationAfter.difference(DateTime.now());

    if (delay.isNegative) delay = Duration.zero;

    _fireAnimationTimer?.cancel();
    _fireAnimationTimer = Timer(delay, () {
      if (mounted && !widget.runBackwards) _animationController.forward();
    });
  }

  @override
  void dispose() {
    _fireAnimationTimer?.cancel();
    _animationController.dispose();

    super.dispose();
  }
}
