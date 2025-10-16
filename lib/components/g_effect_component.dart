import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/effects/g_base_effect.dart';


/// An abstract component that supports visual effects and opacity control.
/// 
/// [GEffectComponent] extends [PositionComponent] and provides functionality
/// for managing a list of [BaseEffect]s. Effects can be added using [addEffect],
/// and are updated and removed automatically in [update]. The component also
/// tracks its alive state and opacity, and uses a customizable [paint].
///
/// Subclasses should implement rendering and additional behavior as needed.


abstract class GEffectComponent extends PositionComponent{
  bool isAlive = true;
  double opacity = 1.0;
  Paint paint = Paint()..color = Colors.white;

  final List<GBaseEffect> _effects = [];


  void addEffect(GBaseEffect effect) {
    _effects.add(effect);
  }

  @override
  void update(double dt) {
    // Update all effects, removing completed ones.
    for (var effect in _effects) {
      effect.update(dt);
    }
    _effects.removeWhere((effect) => effect.isComplete);
  }

}