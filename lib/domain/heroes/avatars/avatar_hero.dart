import 'package:flame/input.dart';
import 'package:flame/src/sprite.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_avatar_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class AvatarHero extends IGameHero {
  late AvatarState state = AvatarState.natural;
  late AvatarType type = AvatarType.blackWoman;


  @override
  void onSelect() {
    // TODO: implement onSelect
  }

  @override
  IGameHeroRepository get repository => MockAvatarRepository();

  Future<GameHeroModel> getModel() async => switch((state, type)){
      (AvatarState state, AvatarType type) 
        when state == AvatarState.sick && type == AvatarType.blackWoman 
        =>  GameHeroModel(
        id: "01", 
        name: "black sick woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/sick_face.png", 
        size: size),
      (AvatarState state, AvatarType type) 
        when state == AvatarState.blemish && type == AvatarType.blackWoman 
        =>  GameHeroModel(
        id: "01", 
        name: "black blemish woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/blemish_face.png", 
        size: size),
      (AvatarState state, AvatarType type) 
        when state == AvatarState.healthy && type == AvatarType.blackWoman 
        => GameHeroModel(
        id: "01", 
        name: "black healthy woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/healthy_face.png", 
        size: size),
      (AvatarState state, AvatarType type) 
        when state == AvatarState.glowing && type == AvatarType.blackWoman 
        => GameHeroModel(
        id: "01", 
        name: "black glowing woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/glowing_face.png", 
        size: size),
      (AvatarState state, AvatarType type) 
        when state == AvatarState.natural && type == AvatarType.blackWoman 
        => GameHeroModel(
        id: "01", 
        name: "black glowing woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/neutral_face.png", 
        size: size),
        (_, _) => GameHeroModel(
        id: "01", 
        name: "black glowing woman", 
        heroType: HeroType.avatar, 
        path: "heroes/avatars/woman/black/glowing_face.png", 
        size: size),
     };

  @override
  Future<GameHero> get hero async {
    GameHeroModel model =  await getModel();
    final Sprite sprite = await Sprite.load(model.path);
    final GameHero hero = GameHero(sprite: sprite, size: Vector2.all(100), path: model.path);
    return hero;
  }
}