/// Interface for Game Hero Repository
library;

import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';

/// This is the contract that all hero repositories must follow.
/// The ViewModel will depend on this abstract class, not any concrete implementation.
/// This is the core of the Dependency Inversion Principle (SOLID).
/// 
abstract class IGameHeroRepository {
  /// [getGameHeroes] method fetches a list of all game heroes.
  List<GameHeroModel> getGameHeroes();

  /// [getHeroesByType] method fetches a list of game heroes filtered by the specified [HeroType].
  List<GameHeroModel> getHeroesByType(HeroType type);
}