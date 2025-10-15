import 'package:flame/components.dart';
import 'package:glow_quest/core/enums/animation_types.dart';

abstract class IHeroEffect {
  void applyHero(HeroEffects effect, PositionComponent hero);
}