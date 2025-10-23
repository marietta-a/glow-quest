
import 'package:flutter/material.dart';

/// A helper widget to animate number changes smoothly.
class AnimatedCounter extends StatelessWidget {
  final int value;
  final TextStyle? style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.style,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    // This widget handles the animation from an old value to a new one
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: value, end: value), // The key is that Obx rebuilds this with a new `end` value
      duration: duration,
      builder: (context, animatedValue, child) {
        return Text(
          animatedValue.toString(),
          style: style,
        );
      },
    );
  }
}