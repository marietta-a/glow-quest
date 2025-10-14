import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/implementation/heroes/terminators/harzardous_item_hero.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_terminator_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

class TerminatorHeroFactory implements ITerminatorHeroFactory{
  @override
  IGameHero createHero(Terminators healthyFoodType) {
    return TerminatorHero();
  }
}