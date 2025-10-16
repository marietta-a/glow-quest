
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flutter/material.dart';

/// A particle effect component that moves with a given velocity and fades out over its lifespan.
/// 
/// The [GParticle] class represents a single particle with a specified velocity and lifespan.
/// It updates its position based on velocity, decreases its lifespan over time, and fades out
/// as its lifespan decreases. When the lifespan reaches zero, the particle is marked as dead.
/// 
/// - [velocity]: The movement vector of the particle.
/// - [lifespan]: The remaining time before the particle disappears.
/// 
/// The particle is rendered as a circle with an orange accent color, and its opacity decreases
/// as its lifespan approaches zero.
/// 

class GParticle extends PositionComponent {
  Vector2 velocity;
  double lifespan;
  bool isAlive = true;
  bool shouldRemoveOnComplete = false;
  Paint paint = Paint()..color = Colors.white;
  double opacity = 1.0;
  Sprite? sprite;
  final Function() onComplete;

  GParticle({
    required this.velocity,
    required this.lifespan,
    required this.onComplete
  }) {
    paint.color = Colors.orangeAccent;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    lifespan -= dt;
    if (lifespan <= 0) {
      isAlive = false;
      onComplete();
    }
    if(!isAlive && shouldRemoveOnComplete){
      removeFromParent();
    }
    opacity = (lifespan / 0.5).clamp(0.0, 1.0); // Fade out
  }

  @override
  void render(Canvas canvas) {
    canvas.save();
    if(sprite == null){
      paint.color = paint.color.withOpacity(opacity);
      canvas.drawCircle(Offset(position.x, position.y), size.x, paint);
    }
    else{
      sprite!.render(canvas, 
        size: size, 
        position: position, 
        anchor: anchor
      );
    }
    canvas.restore();
  }
}