/// Mock implementation of IGameHeroRepository for testing purposes
library;

import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_avatar_repository.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_energy_food_repository.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_harzardous_item_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class MockGameHeroRepository implements IGameHeroRepository{
  @override
  List<GameHeroModel> getGameHeroes() {
    final List<GameHeroModel> avatars = MockAvatarRepository().getGameHeroes();

    final List<GameHeroModel> eneryFoods = MockEnergyFoodRepository().getGameHeroes();

    final List<GameHeroModel> harzardousItems = MockTerminatorRepository().getGameHeroes();

    final List<GameHeroModel> gameHeroes = [
      ...avatars,
      ...eneryFoods,
      ...harzardousItems
    ];

    return gameHeroes;
  }

  @override
  List<GameHeroModel> getHeroesByType(HeroType type) {
    return getGameHeroes().where((hero) => hero.heroType == type).toList();
  }
}