
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

/// [IGameHero] is the interface for game heroes.
abstract class IGameHero extends PositionComponent{

  /// [onSelect] is called when the hero is selected.
  void onSelect();
  
  /// [gameHeroModel] defines the model
  Future<GameHero> get hero async {
    final GameHeroModel model = repository.getGameHeroes().random();
    Sprite sprite =  await Sprite.load(model.path);
    final GameHero hero = GameHero(sprite: sprite, size: model.size, path: model.path);
    return hero;
  }

  /// [repository] defines the hero repository
  IGameHeroRepository get repository;

  // List<Widget> buildHeroWidgets();
}