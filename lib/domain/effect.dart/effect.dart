import 'package:flame/src/components/position_component.dart';
import 'package:glow_quest/domain/models/interface/effects/i_effect.dart';

class Effect implements IEffect{
  @override
  animate(PositionComponent component) {
    // TODO: implement animate
    throw UnimplementedError();
  }

  @override
  applySound(PositionComponent componet) {
    // TODO: implement applySound
    throw UnimplementedError();
  }
  
  @override
  applyEffects(PositionComponent component) {
    applySound(component);
    animate(component);
  }
}