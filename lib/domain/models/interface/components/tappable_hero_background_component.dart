import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/domain/models/interface/components/tappable_hero_component.dart';

class TappableHeroBackgroundComponent extends TappableHeroComponent{
  TappableHeroBackgroundComponent({required super.gameHero, required super.heroType, required super.onSelect});

  late CircleComponent background;
  late Color color = Colors.white;

  @override Future<void> onLoad() async {
    background = CircleComponent(
      radius: super.size.x / 2, // The radius is half the component's size
      paint: Paint()..color = color,
      anchor: Anchor.center,
      position: size / 2, // Center the background within the parent component
    );

    final heroSprite = SpriteComponent(
      sprite: sprite,
      size: size, // Make it slightly smaller than the background for a border effect
      anchor: Anchor.center,
      position: size / 2, // Center the sprite on top of the background
    );

    await add(background);
    await add(heroSprite);
  }

  
}