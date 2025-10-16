import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:glow_quest/core/color_constants.dart';

class LifeBarComponent extends PositionComponent {
  double _currentLife;
  final double _maxLife;
  
  // Paints for drawing
  late final Paint _barPaint;
  late final Paint _backgroundPaint;
  late final Paint _borderPaint;

  // Configuration for visuals
  final double borderWidth;

  LifeBarComponent({
    required double currentLife,
    required double maxLife,
    required super.position,
    required super.size,
    this.borderWidth = 2.0,
    super.anchor = Anchor.topLeft,
    super.priority, // HUDs usually have high priority to render on top
  })  : _currentLife = currentLife,
        _maxLife = maxLife;

  @override
  Future<void> onLoad() async {
    // Initialize paints once here for performance
    _barPaint = Paint()..style = PaintingStyle.fill;
    
    _backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    _borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
  }

  /// Public method to update the current life.
  /// Automatically clamps value between 0 and maxLife.
  void updateLife(double newLife) {
    _currentLife = newLife.clamp(0.0, _maxLife);
  }

  @override
  void render(Canvas canvas) {
    // 1. Calculate percentage (0.0 to 1.0)
    final double percentage = _currentLife / _maxLife;

    // 2. Determine color based on your requirements
    // Note: I interpreted your ranges to form a continuous scale.
    if (percentage < 0.25) {
      _barPaint.color = red;     // < 25%
    } else if (percentage < 0.50) {
      _barPaint.color = Colors.orangeAccent;  // 25% to < 50%
    } else if (percentage < 0.75) {
      _barPaint.color = Colors.yellowAccent;  // 50% to < 75%
    } else {
      _barPaint.color = green;   // 75% upwards
    }

    // Define the drawing area (accounting for border so it doesn't bleed outside)
    final double innerOffset = borderWidth / 2;
    final Rect totalRect = Rect.fromLTWH(
      innerOffset, 
      innerOffset, 
      size.x - borderWidth, 
      size.y - borderWidth
    );

    // 3. Draw Background
    canvas.drawRect(totalRect, _backgroundPaint);

    // 4. Draw Filled Portion
    // Calculate width based on percentage
    final double currentWidth = totalRect.width * percentage;
    if (currentWidth > 0) {
      final Rect fillRect = Rect.fromLTWH(
        innerOffset,
        innerOffset,
        currentWidth,
        totalRect.height
      );
      canvas.drawRect(fillRect, _barPaint);
    }

    // 5. Draw Border (drawn last to sit on top)
    canvas.drawRect(totalRect, _borderPaint);
  }
}