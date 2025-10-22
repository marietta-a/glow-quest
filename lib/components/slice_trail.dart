// components/slice_trail.dart

import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// A helper class to store not just the position of a trail point,
/// but also when it was created. This is key for fading.
class _TrailPoint {
  final Offset position;
  final double timestamp;
  _TrailPoint(this.position, this.timestamp);
}

class SliceTrail extends Component {
  /// The list of points that make up the trail's path.
  final _trailPoints = <_TrailPoint>[];
  
  /// The base paint for the trail. Its properties will be overridden by the vertices.
  final Paint _paint = Paint();

  /// The maximum duration a point will stay in the trail before disappearing.
  final double maxLifetime;

  /// The maximum width of the trail at its start.
  final double maxStrokeWidth;

  /// The current base color of the trail.
  Color _color;

  /// Public accessor to allow changing the trail color dynamically.
  Color get color => _color;
  set color(Color value) {
    _color = value;
  }

  SliceTrail({
    Color color = Colors.white,
    this.maxStrokeWidth = 8.0,
    this.maxLifetime = 0.3, // A shorter lifetime for a snappier feel
  }) : _color = color;


  /// Adds a new point to the trail's history.
  void addPoint(Vector2 point) {
    final now = DateTime.now().millisecondsSinceEpoch / 1000.0;
    _trailPoints.add(_TrailPoint(point.toOffset(), now));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Prune old points from the trail.
    final now = DateTime.now().millisecondsSinceEpoch / 1000.0;
    _trailPoints.removeWhere((p) => now - p.timestamp > maxLifetime);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (_trailPoints.length < 2) {
      return; // Not enough points to draw a line
    }

    final now = DateTime.now().millisecondsSinceEpoch / 1000.0;
    final vertices = <Offset>[];
    final colors = <Color>[];

    // We build a "ribbon" of triangles from the points.
    // Each point in the trail will have two vertices, one on each side.
    for (int i = 0; i < _trailPoints.length - 1; i++) {
      final p1 = _trailPoints[i];
      final p2 = _trailPoints[i + 1];

      // Calculate the direction and a perpendicular "normal" vector.
      final direction = p2.position - p1.position;
      if (direction.distance < 0.1) continue; // Skip if points are too close
      
      final normal = Offset(-direction.dy, direction.dx).scale(1 / direction.distance, 1 / direction.distance);

      // --- Aesthetics Calculation ---
      // 1. Progress along the trail (0.0 at the oldest point, 1.0 at the newest)
      final progress = i / (_trailPoints.length - 1);
      
      // 2. Tapering width: Thicker at the start, thinner at the end.
      // We use a curve to make the taper look more natural.
      final double width = maxStrokeWidth * (1.0 - Curves.easeIn.transform(progress));

      // 3. Fading color: More opaque at the start, fading to transparent at the end.
      final age = now - p1.timestamp;
      final double opacity = (1.0 - (age / maxLifetime)).clamp(0.0, 1.0);
      final Color currentColor = color.withOpacity(opacity);
      
      // Calculate the two vertices for the current point.
      final vertex1 = p1.position + normal * (width / 2);
      final vertex2 = p1.position - normal * (width / 2);
      
      // Add the vertices and their corresponding colors.
      vertices.add(vertex1);
      vertices.add(vertex2);
      colors.add(currentColor);
      colors.add(currentColor);
    }
    
    // Create the Vertices object. VertexMode.triangleStrip is perfect for ribbons.
    final vertexData = Vertices(
      VertexMode.triangleStrip,
      vertices,
      colors: colors,
    );
    
    // Draw the entire ribbon in a single, efficient operation.
    canvas.drawVertices(vertexData, BlendMode.srcOver, _paint);
  }
}