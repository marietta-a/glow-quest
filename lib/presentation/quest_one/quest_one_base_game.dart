
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/heroes/heroes/quest_one_hero.dart';
import 'package:glow_quest/components/tappable_hero_component.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_controller.dart';

class QuestOneBaseGame extends QuestOneBase
{
  late QuestOneBaseController viewModel = Get.find<QuestOneBaseController>();

  /// default sprite size
  final Vector2 spriteSize = Vector2.all(100);

  // Spawner timer
  final Timer _timer = Timer(1.0, repeat: true); 
  late double screenWidth = 0;
  late double spawnableWidth = 0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    viewModel.winningScore.value = winningValue;
    _timer.onTick = spawnObject;
  }// Spawns an item every 1.5 seconds


  @override
  Color backgroundColor() {
    return Colors.black;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt); // Update the spawner timer on each frame

    allGameHeroes = children.whereType<TappableHeroComponent>()
                    .map((b) => updateLocation(dt, b)) /// update update hero's position
                    .toList();

    removeHeroesInactiveHeroes();
  
    checkGameState();
  }

  @override
  int get winningValue => 100;

  List<TappableHeroComponent> getInActiveHeroes(){
    return allGameHeroes.where((b) => b.position.y >= size.y)
                 .map((b) => decreaseScoreForLostHero(b))
                 .toList();
  }


  void removeHeroesInactiveHeroes() {
    if(getInActiveHeroes().isNotEmpty){
      removeAll(getInActiveHeroes());
    }
  }

  TappableHeroComponent decreaseScoreForLostHero(TappableHeroComponent hero){
    if(hero.heroType == HeroType.hero){
      viewModel.decreaseScore(1);
    }
    return hero;
  }
  
  
  Future<void> spawnObject() async {
    await addHero();
    await addDistractor();
    await addTerminator();
  }
  

  
  Future<void> addHero() async {
   add(QuestOneHero(
        gameHero: viewModel.hero, 
        onSelect: onTapDown, 
        heroType: HeroType.hero, 
      )
      ..size = viewModel.hero.size
    );
  }
  
  Future<void> addDistractor() async {
    if(heroes.length >= 2){
      add(QuestOneHero(
          gameHero: viewModel.distractor, 
          onSelect: onTapDown, 
          heroType: HeroType.distractor, 
        )
        ..size = viewModel.hero.size
      );
    }
  }
  
  Future<void> addTerminator() async {
    if(distractors.length >= 2){
      add(QuestOneHero(
          gameHero: viewModel.terminator, 
          onSelect: onTapDown, 
          heroType: HeroType.terminator, 
        )
        ..size = viewModel.hero.size
        ..anchor = Anchor.center
      );
    }
  }


  // --- Public methods for components to call ---
  @override
  void increaseScore(int points) {
    viewModel.increaseScore(points);
  }

  @override
  void decreaseScore(int penalty) {
    viewModel.decreaseScore(penalty);
  }

  @override
  void endGame(String message) {
    viewModel.endGame(message);
    super.endGame(message);
  }

  @override
  void winGame(String message) {
    viewModel.winGame(message);
    super.winGame(message);
  }
  
  void updateGameState(TappableHeroComponent hero) {
    switch(hero.heroType){
      case HeroType.hero:
        viewModel.increaseScore(incrementValue);
      break;
      case HeroType.avatar:
      
        break;
      case HeroType.distractor:
        viewModel.decreaseScore(deductionValue);
      break;
      case HeroType.terminator:
        endGame("You selected a harzardouse item");
      break;
    }
  }
  
  void checkForGameOver() {
    if (viewModel.score.value! < 0  ) {
      endGame(viewModel.gameOverMessage.value ?? "Game Over");
    }
  }
  
  void checkForGameWon() {
    if (viewModel.score.value! >=  winningValue  ) {
      winGame(viewModel.gameWonMessage.value ?? "Game Won");
    }
  }
  
  void checkGameState() {
    checkForGameOver();
    checkForGameWon();
  }
  

}