import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/components/point_component.dart';
import 'package:glow_quest/components/tappable_hero_component.dart';
import 'package:glow_quest/effects/burst_effect.dart';
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_game.dart';

class QuestOneHero extends TappableHeroComponent with HasGameReference<QuestOneBaseGame> {
  QuestOneHero({
    required super.gameHero,
    required super.heroType,
    required super.onSelect,
  });

  // Renamed for clarity: this flag now handles both taps and slices.
  bool _isBeingDestroyed = false;

  // --- NEW: For the glowing and pulsing effect ---
  late final Paint _glowPaint;
  double _pulseTimer = 0.0;
  static const double _pulseSpeed = 2.5;
  static const double _minBlur = 8.0;
  static const double _maxBlur = 16.0;
  
  @override
  Future<void> onLoad() async {
    final hero = await gameHero.hero;
    sprite = hero.sprite;
    position = game.getRandomPosition(); // Assuming this is now handled in your game class
    anchor = Anchor.center;
    size = hero.size;

    late final Color glowColor;
    switch (heroType) {
      case HeroType.hero:
        glowColor = Colors.cyan.withOpacity(0.8);
        break;
      case HeroType.distractor:
        glowColor = Colors.redAccent.withOpacity(0.8);
        break;
      default:
        glowColor = Colors.transparent;
    }

    _glowPaint = Paint()
      ..color = glowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, _minBlur);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_isBeingDestroyed) return;

    _pulseTimer += dt * _pulseSpeed;
    final pulseValue = (sin(_pulseTimer) + 1) / 2;
    final currentBlur = _minBlur + (_maxBlur - _minBlur) * pulseValue;
    _glowPaint.maskFilter = MaskFilter.blur(BlurStyle.normal, currentBlur);
  }
  
  @override
  void render(Canvas canvas) {
    if (!_isBeingDestroyed && _glowPaint.color != Colors.transparent) {
      canvas.drawCircle(size.toOffset() / 2, size.x / 1.8, _glowPaint);
    }
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownEvent event) {
    // Tapping now just calls our new slice method.
    slice();
  }

  // --- NEW: A public method to handle the hero's destruction ---
  // This can be called by a tap or by the slice gesture in the game class.
  void slice() {
    if (_isBeingDestroyed) return;
    _isBeingDestroyed = true;

    // Make the glow transparent immediately.
    _glowPaint.color = Colors.transparent;

    game.updateGameState(this);

    final shouldAddPoint = [HeroType.hero, HeroType.distractor].contains(heroType);
    add(
      BurstEffect(
        controller: GEffectController(duration: 0.3),
        particleCount: 10,
        particleSize: size / 4,
        onComplete: () {  
          removeFromParent();
        },
      ),
    );
    if (shouldAddPoint) {
      add(
        PointComponent(
          pointGained: heroType == HeroType.hero, 
          point: heroType == HeroType.hero ? game.incrementValue : game.deductionValue, 
        )..size = Vector2(10, 10)
      );
    }
  }
}