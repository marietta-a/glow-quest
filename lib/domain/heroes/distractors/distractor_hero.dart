import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_distractor_item_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class DistractorHero extends IGameHero{
  @override
  void onSelect() {
    // TODO: implement onSelect
  }
  

  @override
  IGameHeroRepository get repository => MockDistractorItemRepository();
}