import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ExplosionEffect extends PositionComponent {

  PositionComponent child;
  // double maxRadius;
  // double duration;

  ExplosionEffect({required this.child});


  final Timer _timer = Timer(0.2, repeat: true);
  late final Paint _paint;
  late double tChange;

  @override onLoad(){
    
  }

  @override
  void update(double dt) {
    _timer.update(dt);
    _timer.onTick = createExplosion;
    tChange = dt;
  }

  void createExplosion() {

    final xChange = child.x + tChange;
    final yChange = child.y + tChange;
    child.size = Vector2(xChange, yChange);
  }

}