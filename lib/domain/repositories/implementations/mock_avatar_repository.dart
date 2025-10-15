import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/core/size_constants.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class MockAvatarRepository implements IGameHeroRepository {
  @override
  List<GameHeroModel> getGameHeroes() {
    return[
      GameHeroModel(
        id: "01", 
        path: "assets/heroes/avatars/woman/black/blemish_face.png",
        name: "blemish face", 
        heroType: HeroType.avatar,
        size: avatarSize,
      ),

      GameHeroModel(
        id: "02", 
        path: "assets/heroes/avatars/woman/black/glowing_face.png",
        name: "glowing face", 
        heroType: HeroType.avatar,
        size: avatarSize,
      ),
      
      GameHeroModel(
        id: "03", 
        path: "assets/heroes/avatars/woman/black/healthy_face.png",
        name: "healthy face", 
        heroType: HeroType.avatar,
        size: avatarSize,
      ),
      
      GameHeroModel(
        id: "04", 
        path: "assets/heroes/avatars/woman/black/neutral_face.png",
        name: "neutral face", 
        heroType: HeroType.avatar,
        size: avatarSize,
      ),
      
      GameHeroModel(
        id: "05", 
        path: "assets/heroes/avatars/woman/black/sick_face.png",
        name: "sick face", 
        heroType: HeroType.avatar,
        size: avatarSize,
      ),
    ];
  }

  @override
  List<GameHeroModel> getHeroesByType(HeroType type) {
    // TODO: implement getHeroesByType
    throw UnimplementedError();
  }
}