import 'dart:math';

import 'package:flame/components.dart';
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';
import 'package:glow_quest/effects/g_base_effect.dart';
import 'package:glow_quest/effects/mixins/g_effect_target.dart';
import 'package:glow_quest/particles/g_particle.dart';

class BurstEffect extends GBaseEffect with GEffectTarget<PositionComponent> {
  // double endScale;
  final int particleCount;
  Vector2? particleSize; 
  final Function() onComplete;

  late double _startScale;
  bool _hasBurst = false;
  final random = Random();
  bool _isCompleted = false;

  BurstEffect({
    required GEffectController controller,
    // required this.endScale,
    required this.onComplete,
    this.particleSize,
    this.particleCount = 10,
  }) : super(controller);

  @override
  void onMount() {
    super.onMount();
    _startScale = target.scale.x; 
  }

  @override
  void apply(double progress) {
    // final scaleRange = endScale - _startScale;
    // target.scale = Vector2.all(_startScale + (scaleRange * progress));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isComplete && !_hasBurst) {
      _burst();
      _hasBurst = true;
      // Now that the burst has happened, remove the original component.
      // target.removeFromParent(); 
    }
  }

  GParticle _spawnRandomParticle() {
    // final speed = random.nextDouble() * 150 + 50; // Speed between 50 and 200 p/s
    
    final speed = random.nextDouble() * 150 + 50; 
    final angle = random.nextDouble() * 2 * pi;
    final direction = Vector2(cos(angle), sin(angle));
    final velocity = direction * speed;
    final lifespan = random.nextDouble() * 0.5 + 0.2;

    final particle = GParticle(
      velocity: velocity, 
      lifespan: lifespan, 
      onComplete: (){
        if(_isCompleted){
          onComplete();
        }
      })
      // ..position = target.position
      ..size = particleSize ?? target.size / 4
      ..shouldRemoveOnComplete = true;
      

    if(target is SpriteComponent){
      final spriteComponent = (target as SpriteComponent)..opacity = 0.0;
      particle.sprite = spriteComponent.sprite;
    
    }
      
    return particle;
  }

  void _burst() {
    final List<GParticle> particles = List.generate(particleCount, (i){
      _isCompleted = i == particleCount - 1;
      return _spawnRandomParticle();
    });
    addAll(particles);
    // target.addAll(particles);
  }
}