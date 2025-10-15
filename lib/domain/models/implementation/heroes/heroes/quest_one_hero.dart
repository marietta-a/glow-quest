import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:glow_quest/domain/components/tappable_hero_component.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_game.dart';

class QuestOneHero extends TappableHeroComponent with HasGameReference<QuestOneBaseGame> {

  QuestOneHero({required super.gameHero, required super.heroType, required super.onSelect});

  late TappableHeroComponent _component;
  
  @override
  Future<void> onLoad() async {
    await spawnHero();
  }

  

  /// updated the game's state and
  /// remove hero from parent
  @override
  void onTapDown(TapDownEvent event) {
    game.updateGameState(_component);
    
    
    removeFromParent();
  }


  /// [spawnHero] creates a new hero of type [heroType]
  Future<void> spawnHero() async {
    final hero = await gameHero.hero;
    sprite = hero.sprite;
    _component = TappableHeroComponent(
      gameHero: gameHero, 
      heroType: super.heroType,
      onSelect: onTapDown
    )
    ..position = game.getRandomPosition()
    ..anchor = Anchor.center;

    add(_component);
  }
  
}