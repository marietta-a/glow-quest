/// Interface for Hero Factory
library;

import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

abstract class IGameHeroFactory {

  /// [createHero] creates a hero based on the provided [heroType].
  IGameHero createHero(HeroType heroType);

  /// [getHeroes] method creates heroes based on the heroType
  List<GameHeroModel> createHeroes(HeroType heroType);

  /// [createGameHeroRepository] method creates the repository base on heroType
  IGameHeroRepository createGameHeroRepository(HeroType heroType);
}

