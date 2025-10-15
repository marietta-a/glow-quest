
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/core/size_constants.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class MockDistractorItemRepository implements IGameHeroRepository {
  @override
  List<GameHeroModel> getGameHeroes() {
    return [
      GameHeroModel(
        id: "01", 
        path: "heroes/distractors/candy.png",
        name: "candy", 
        heroType: HeroType.distractor,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "02", 
        path: "heroes/distractors/cheese_burger.png",
        name: "cheese burger", 
        heroType: HeroType.distractor,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "03", 
        path: "heroes/distractors/cupcake.png",
        name: "cupcake", 
        heroType: HeroType.distractor,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "04", 
        path: "heroes/distractors/lollipop.png",
        name: "lollipop", 
        heroType: HeroType.distractor,
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