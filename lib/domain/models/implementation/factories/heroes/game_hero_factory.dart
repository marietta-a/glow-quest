import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/heroes/avatars/avatar_hero.dart';
import 'package:glow_quest/domain/heroes/terminators/harzardous_item_hero.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_game_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_avatar_repository.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_harzardous_item_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class GameHeroFactory implements IGameHeroFactory{
  @override
  IGameHero createHero(HeroType heroType) {
    switch(heroType){
      case HeroType.avatar:
        return AvatarHero();
      case HeroType.hero:
      case HeroType.distractor:
      case HeroType.terminator:
        return TerminatorHero();
    }
  }

  @override
  IGameHeroRepository createGameHeroRepository(HeroType heroType) {
    switch(heroType){
      case HeroType.avatar:
        return MockAvatarRepository();
      case HeroType.hero:
        throw UnimplementedError();
      case HeroType.distractor:
        throw UnimplementedError();
      case HeroType.terminator:
        return MockTerminatorRepository();
    }
  }

  @override
  List<GameHeroModel> createHeroes(HeroType heroType) {
     final repository = createGameHeroRepository(heroType);
     return repository.getGameHeroes();
  }
}