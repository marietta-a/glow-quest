
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/domain/heroes/avatars/avatar_hero.dart';

class AvatarHeroComponent extends SpriteComponent with TapCallbacks {
  final AvatarHero gameHero;
  AvatarHeroComponent({super.position, required this.gameHero});


  // --- Configuration ---
  // Tweak these values to change the avatar's "feel"
  final double _idleHoverHeight = 5.0;
  final double _jumpHeight = 20.0;
  final double _jumpDuration = 0.3;
  // --- End Configuration ---
  
  late final Effect _idleEffect;
  late final Paint _shadowPaint;
  bool _isJumping = false;
  bool _isDragging = false;

  @override
  Future<void> onLoad() async {
    final hero = await gameHero.hero;
    sprite = hero.sprite;
    size = hero.size; // Set a fixed size for the avatar
    anchor = Anchor.center;

    // The shadow paint
    _shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0);

    // Create the idle hover effect
    _idleEffect = SequenceEffect(
      [
        MoveByEffect(Vector2(0, -_idleHoverHeight), EffectController(duration: 1.5, curve: Curves.easeInOut)),
        MoveByEffect(Vector2(0, _idleHoverHeight), EffectController(duration: 1.5, curve: Curves.easeInOut)),
      ],
      infinite: true,
    );
    
    // Start the idle animation
    // add(_idleEffect);
  }

    // NEW: Override onMount for positioning relative to a parent.
  @override
  void onMount() {
    super.onMount();

    // This code runs only if an anchorPosition was provided.
    if (parent is PositionComponent) {
      final parentComponent = parent as PositionComponent;

      // Set anchor and position based on the enum
      switch (anchor) {
        case Anchor.bottomRight:
          anchor = Anchor.bottomRight;
          position = parentComponent.size;
          break;
        case Anchor.bottomLeft:
          anchor = Anchor.bottomLeft;
          position = Vector2(0, parentComponent.size.y);
          break;
        case Anchor.topRight:
          anchor = Anchor.topRight;
          position = Vector2(parentComponent.size.x, 0);
          break;
        case Anchor.topLeft:
          anchor = Anchor.topLeft;
          position = Vector2.zero();
          break;
        case Anchor.center:
          anchor = Anchor.center;
          position = parentComponent.size / 2;
          break;
      }
    }
  }

  // --- Rendering ---
  @override
  void render(Canvas canvas) {
    // Draw the shadow first so it's behind the sprite
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.x / 2, size.y / 1.1), // Position the shadow slightly below the center
        width: size.x * 0.8, // Shadow width
        height: size.y * 0.25, // Shadow height
      ),
      _shadowPaint,
    );

    // Then, let the parent class render the sprite
    super.render(canvas);
  }

  // --- Interactivity ---

  @override
  void onTapDown(TapDownEvent event) {
    if (_isJumping || _isDragging) return; // Don't jump if already jumping or being dragged
    _isJumping = true;

    // Pause the idle animation
    _idleEffect.pause();

    // Create the happy jump effect
    final jumpEffect = SequenceEffect(
      [
        // Squash down and jump up
          MoveByEffect(Vector2(0, -_jumpHeight), EffectController(duration: _jumpDuration, curve: Curves.easeOut)),
        // Fall down and stretch back to normal
        
         MoveByEffect(Vector2(0, _jumpHeight), EffectController(duration: _jumpDuration * 0.8, curve: Curves.easeIn)),
      ],
      onComplete: () {
        // When the jump is finished
        _isJumping = false;
        _idleEffect.resume(); // Resume idling
      },
    );

    // add(jumpEffect);
    _spawnCelebrationParticles();
  }
  
  void _spawnCelebrationParticles() {
    final random = Random();
    // A function to generate a random vector for particle velocity
    Vector2 randomVector() {
      return (Vector2.random(random) - Vector2.all(0.5)) * 200;
    }

    // A list of fun, bright colors
    final colors = [
      Colors.yellow,
      Colors.cyan,
      Colors.pinkAccent,
      Colors.lightGreenAccent,
    ];

    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 15, // Spawn 15 particles
        lifespan: 0.8,
        generator: (i) => AcceleratedParticle(
          speed: randomVector(),
          acceleration: Vector2(0, 200), // Apply gravity
          child: CircleParticle(
            radius: 2.0 + random.nextDouble() * 3.0,
            paint: Paint()..color = colors[random.nextInt(colors.length)],
          ),
        ),
      ),
      // Position the particle burst at the avatar's center
      position: size / 2, 
    );

    add(particleComponent);
  }
}