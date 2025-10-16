import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:glow_quest/domain/models/interface/effects/i_effect.dart';

class BlastEffect<T extends FlameGame> extends IEffect{
  
  final SpriteComponent child;
  final int childrenCount;
  bool reverse = false;
  bool hold = false;
  Function() onComplete;

  BlastEffect({required this.child, required this.childrenCount, required this.onComplete});
  

  @override
  FutureOr<void> onLoad() {
    sprite = child.sprite;
    animate(child);
  }

  
  @override
  SpriteComponent applyEffects(SpriteComponent component) {
    // TODO: implement applyEffects
    throw UnimplementedError();
  }
  
  @override
  SpriteComponent applySound(SpriteComponent component) {
    // TODO: implement applySound
    throw UnimplementedError();
  }
  
  @override
  SpriteComponent animate(SpriteComponent component) {
     component.add(
      ScaleEffect.by(
        reverse ? Vector2.all(1 / 1.5) : Vector2.all(0.75),
        EffectController(duration: 0.3),
        onComplete: (){
          hold = false;
          child.opacity = 0.0;
          final children = List.generate(childrenCount, (_) => _spawnRandomChild(component));
          component.addAll(children);
          // Remove parent after last child's effect completes
          children.last.add(RemoveEffect(
            delay: 0.5,
            onComplete: removeFromParent,
          ));
        }
     )
    );
    return component;
  }

  

  SpriteComponent _spawnRandomChild(SpriteComponent component) {
    // Define how far the particles should travel from the center.
    const dispersionDistance = 50;

    // 1. All children now spawn at the center of the parent component.
    final spawnChild = SpriteComponent(
      sprite: component.sprite,
      size: component.size / 4,
      position: component.position, 
      anchor: Anchor.center,
    );

    // 2. Calculate a random angle in radians (a full circle is 2 * pi).
    final randomAngle = random.nextDouble() * 2 * pi;

    // 3. Create a direction vector using trigonometry and scale it by the distance.
    //    - cos(angle) gives the x component of a point on the unit circle.
    //    - sin(angle) gives the y component.
    final moveVector = Vector2(
      cos(randomAngle) * dispersionDistance,
      sin(randomAngle) * dispersionDistance,
    );

    spawnChild.add(
      MoveByEffect(
        moveVector,
        EffectController(duration: 0.5),
        onComplete: () => spawnChild.removeFromParent(), // More robust way to remove
      ),
    );

    return spawnChild;
  }

  
}