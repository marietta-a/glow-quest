
import 'dart:math';

import 'package:flame/components.dart';
abstract class IEffect extends SpriteComponent{
  SpriteComponent applySound(SpriteComponent component);
  SpriteComponent animate(SpriteComponent component);
  SpriteComponent applyEffects(SpriteComponent component);
  final Random random = Random();
}