import 'package:flame/input.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/core/size_constants.dart';
import 'package:glow_quest/domain/models/hero_models/game_hero_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

class MockEnergyFoodRepository implements IGameHeroRepository {

  @override
  List<GameHeroModel> getGameHeroes() {
    return  [
      GameHeroModel(
        id: "01", 
        path: "heroes/foods/energy-boosters/almond.png",
        name: "almond", 
        heroType: HeroType.hero,
        size: roundedSize
      ),
      GameHeroModel(
        id: "02", 
        path: "heroes/foods/energy-boosters/apple.png",
        name: "apple", 
        heroType: HeroType.hero,
        size: roundedSize
      ),
      GameHeroModel(
        id: "03", 
        path: "heroes/foods/energy-boosters/banana.png",
        name: "banana", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "04", 
        path: "heroes/foods/energy-boosters/berries.png",
        name: "berries", 
        heroType: HeroType.hero,
        size: Vector2(150, 100),
      ),
      GameHeroModel(
        id: "05", 
        path: "heroes/foods/energy-boosters/chia_seeds.png",
        name: "chia_seeds", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "06", 
        path: "heroes/foods/energy-boosters/egg.png",
        name: "egg", 
        heroType: HeroType.hero,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "07", 
        path: "heroes/foods/energy-boosters/grape.png",
        name: "grape", 
        heroType: HeroType.hero,
        size: elongatedSize,
      ),
      GameHeroModel(
        id: "08", 
        path: "heroes/foods/energy-boosters/greek_yoghurt.png",
        name: "greek yoghurt", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "09", 
        path: "heroes/foods/energy-boosters/oatmeal.png",
        name: "oatmeal", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "10", 
        path: "heroes/foods/energy-boosters/orange.png",
        name: "orange", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "11", 
        path: "heroes/foods/energy-boosters/avocado.png",
        name: "avocado", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "12", 
        path: "heroes/foods/energy-boosters/walnut.png",
        name: "walnut", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
      GameHeroModel(
        id: "13", 
        path: "heroes/foods/energy-boosters/salmon.png",
        name: "salmon", 
        heroType: HeroType.hero,
        size: roundedSize,
      ),
    ];
  }

  @override
  List<GameHeroModel> getHeroesByType(HeroType type) {
    // TODO: implement getHeroesByType
    throw UnimplementedError();
  }
}