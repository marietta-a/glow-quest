import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:glow_quest/domain/components/tappable_hero_component.dart';
import 'package:glow_quest/effects/burst_effect.dart'; // We will use this
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_game.dart';

class QuestOneHero extends TappableHeroComponent with HasGameReference<QuestOneBaseGame> {
  QuestOneHero({
    required super.gameHero,
    required super.heroType,
    required super.onSelect,
  });

  bool _isBeingRemoved = false;

  @override
  Future<void> onLoad() async {
    // This component now configures ITSELF. No more child `_component`.
    final hero = await gameHero.hero;
    sprite = hero.sprite;
    position = game.getRandomPosition();
    anchor = Anchor.center;
    size = hero.size; // Use a consistent size from the game
  }

  @override
  void onTapDown(TapDownEvent event) {
    // Prevent the player from tapping a hero that's already bursting.
    if (_isBeingRemoved) return;
    _isBeingRemoved = true;

    // 1. Update the game state immediately.
    // We pass 'this' because this component IS the hero that was tapped.
    game.updateGameState(this);

    // 2. Add the BurstEffect directly to THIS component.
    add(
      BurstEffect(
        controller: GEffectController(duration: 0.3),
        endScale: 2.0,
        particleCount: 10,
        onComplete: () {  
          removeFromParent();
        },
      ),
    );
  }
}