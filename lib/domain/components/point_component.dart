import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class PointComponent extends PositionComponent {
  final bool pointGained;
  final int point;

  PointComponent({
    required this.pointGained,
    required this.point
  });

  @override
  Future<void> onLoad() async {
    final color = pointGained ? const Color.fromARGB(255, 1, 92, 4) : const Color.fromARGB(255, 178, 15, 4);
    final text = pointGained ? '+$point' : '-$point';

    final circle = CircleComponent(
      radius: 20,
      anchor: Anchor.center, 
      paint: Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );

    final textComponent = TextComponent(
      text: text,
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(blurRadius: 4, color: Colors.black54),
          ],
        ),
      ),
    );

    addAll([circle, textComponent]);

    add(
      MoveByEffect(
        Vector2(0, -60), 
        EffectController(
          duration: 1.5,
          curve: Curves.easeOut, 
        ),
      ),
    );

    add(RemoveEffect(delay: 1.5));
  }

}