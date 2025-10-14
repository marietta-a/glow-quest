
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_energy_food_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';
class EnergyFoodHero extends IGameHero {
  @override
  void onSelect() {
  }

  @override
  IGameHeroRepository get repository => MockEnergyFoodRepository();

}