
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_harzardous_item_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class TerminatorHero extends IGameHero {

  @override
  void onSelect() {
    // TODO: implement onSelect
  }

  @override
  IGameHeroRepository get repository => MockTerminatorRepository();
}