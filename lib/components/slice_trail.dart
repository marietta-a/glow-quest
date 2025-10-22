// components/slice_trail.dart

import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class SliceTrail extends Component {
  // A list of points in the trail.
  final _points = <Offset>[];
  // The paint used to draw the trail.
  late final Paint _paint;
  // A timer to control the fade-out effect.
  late final Timer _fadeoutTimer;
  // The initial opacity of the trail.
  double _opacity = 0.9;

  SliceTrail({Color color = Colors.white, double strokeWidth = 5.0}) {
    _paint = Paint()
      ..color = color.withOpacity(_opacity)
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round // Makes the trail ends smooth.
      ..style = PaintingStyle.stroke;
    
    // After 0.3 seconds, start fading out.
    _fadeoutTimer = Timer(0.06, onTick: () {
      _opacity = _opacity > 0 ? _opacity - 0.1 : 0;
      if (_opacity <= 0) {
        removeFromParent(); // Remove the trail when it's fully faded.
      } else {
        _fadeoutTimer.start(); // Reset the timer for the next fade step.
      }
    }, repeat: false);
  }

  @override
  void update(double dt) {
    _fadeoutTimer.update(dt);
    // Update the paint's opacity.
    // _paint.color = _paint.color.withOpacity(_opacity);
  }

  @override
  void render(Canvas canvas) {
    // If there are at least two points, draw lines between them.
    if (_points.length > 1) {
      final path = Path()..addPolygon(_points, false);
      canvas.drawPath(path, _paint);
    }
  }

  // Public method to add a new point to the trail.
  void addPoint(Vector2 point) {
    // Don't restart the timer if we are already fading.
    if (!_fadeoutTimer.isRunning()) {
      _fadeoutTimer.start();
    }
    _points.add(point.toOffset());
  }
}