import 'package:flame/src/sprite.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class AvatarHero extends IGameHero {
  @override
  void onSelect() {
    // TODO: implement onSelect
  }

  @override
  // TODO: implement repository
  IGameHeroRepository get repository => throw UnimplementedError();

  @override
  // TODO: implement sprite
  Future<Sprite> get sprite => throw UnimplementedError();

}