import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/core/size_constants.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_terminator_repository.dart';

class MockTerminatorRepository implements ITerminatorRepository{
  @override
  List<GameHeroModel> getGameHeroes() {
    return [
      GameHeroModel(
        id: "01", 
        path: "heroes/harzardous_items/battery.png",
        name: "battery", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "02", 
        path: "heroes/harzardous_items/broken_glass.png",
        name: "broken glass", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "03", 
        path: "heroes/harzardous_items/bug_spray.png",
        name: "bug spray", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "04", 
        path: "heroes/harzardous_items/knife.png",
        name: "knife", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "04", 
        path: "heroes/harzardous_items/poison.png",
        name: "poison", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "04", 
        path: "heroes/harzardous_items/razor_blade.png",
        name: "razor_blade", 
        heroType: HeroType.terminator,
        size: elongatedSize,
      ),
    ];
  }

  @override
  List<GameHeroModel> getHeroesByType(HeroType type) {
    // TODO: implement getHeroesByType
    throw UnimplementedError();
  }
}