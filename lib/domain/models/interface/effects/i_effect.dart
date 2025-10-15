import 'package:flame/components.dart';

abstract class IEffect {
  applySound(PositionComponent componet);
  animate(PositionComponent component);

  applyEffects(PositionComponent component);
}