/// Interface for harzardous Hero Factory
library;

import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

abstract class ITerminatorHeroFactory {

  /// [createHero] creates a hero based on the provided [heroType].
  IGameHero createHero(Terminators terminator);
}