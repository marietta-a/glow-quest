/// Base View Model for Quest One
library;

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_distractor_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_terminator_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_healthy_food_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

abstract class QuestOneBaseController extends GetxController{
 final IDistractorHeroFactory _distractorFactory;
 final ITerminatorHeroFactory _terminatorFactory;
 final IHealthyFoodHeroFactory _heroFactory;

  QuestOneBaseController({
    required IHealthyFoodHeroFactory heroFactory,
    required ITerminatorHeroFactory terminatorFactory, 
    required IDistractorHeroFactory distractorFactory,})
      : _heroFactory = heroFactory,
        _terminatorFactory = terminatorFactory,
        _distractorFactory = distractorFactory;
      

  // --- Reactive State Variables (for Flutter UI) ---
  final score = Rxn<int>();
  final livesLost = Rxn<int>();
  final maxLives = 4;
  final winningScore = Rxn<int>();

  /// [gameOverMessage] is null when the game is ongoing, and contains a message when the game is over
  final gameOverMessage = Rxn<String>(); // Nullable String

  /// [gameWonMessage] is null when the game is ongoing, and contains a message when the game is won
  final gameWonMessage = Rxn<String>(); // Nullable String

  /// [hero] boosts the score
  late IGameHero hero;

  
  /// [terminator] ends the game
  late IGameHero terminator;

  
  /// [distractor] decreases the score
  late IGameHero distractor;

  /// [healthyFoodType] defines the type of healthy food hero to be created
  HealthyFoodType get healthyFoodType => HealthyFoodType.energyFood;

  @override
  void onInit() {
    super.onInit();
    score.value = 0;
    hero = _heroFactory.createHero(healthyFoodType);
    terminator = _terminatorFactory.createHero(Terminators.general);
    distractor = _distractorFactory.createHero(Distractors.general);
  }

  // --- Callbacks from the FlameGame ---
  void increaseScore(int points) {
    if (score.value != null) {
      score.value = score.value! + points;
    } else {
      score.value = points;
    }
  }

  void decreaseScore(int penalty) {
    if (score.value != null) {
      score.value = score.value! - penalty;
    } else {
      score.value = 0 - penalty;
    }
  }
  void incrementLifeLost() {
    if (livesLost.value != null) {
      livesLost.value = livesLost.value!  + 1;
    } else {
      livesLost.value = 0 + 1;
    }
  }

  void endGame(String message) {
    gameOverMessage.value = message;
  }

  void winGame(String message) {
    gameWonMessage.value = message;
  }
}