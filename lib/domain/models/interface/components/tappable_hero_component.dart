import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

class TappableHeroComponent extends SpriteComponent with TapCallbacks{

  IGameHero gameHero;
  HeroType heroType;
  
  void Function(TapDownEvent event) onSelect;

  TappableHeroComponent({
    required this.gameHero,
    required this.heroType,
    required this.onSelect,
    super.position,
    super.size,
    super.anchor,
  });

  
  @override
  Future<void> onLoad() async {
    await setHeroSprite();
  }

  @override
  void onTapDown(TapDownEvent event) {
    onSelect(event);
  }


  Future<void> setHeroSprite() async {
    final hero = await gameHero.hero;
    super.sprite = hero.sprite;
    super.size = hero.size;
  }
}