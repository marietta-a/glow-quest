import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/core/size_constants.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class MockTerminatorRepository implements IGameHeroRepository{
  @override
  List<GameHeroModel> getGameHeroes() {
    return [
      GameHeroModel(
        id: "01", 
        path: "heroes/harzardous_items/bomb.png",
        name: "bomb", 
        heroType: HeroType.terminator,
        size: roundedSize,
      ),
      // GameHeroModel(
      //   id: "02", 
      //   path: "heroes/harzardous_items/bug_spray.png",
      //   name: "bug spray", 
      //   heroType: HeroType.terminator,
      //   size: elongatedSize,
      // ),
      // GameHeroModel(
      //   id: "03", 
      //   path: "heroes/harzardous_items/poison.png",
      //   name: "poison", 
      //   heroType: HeroType.terminator,
      //   size: elongatedSize,
      // ),
    ];
  }

  @override
  List<GameHeroModel> getHeroesByType(HeroType type) {
    // TODO: implement getHeroesByType
    throw UnimplementedError();
  }
}