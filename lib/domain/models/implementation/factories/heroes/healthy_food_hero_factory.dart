import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/heroes/heroes/energy_foods/energy_food_hero.dart';
import 'package:glow_quest/domain/heroes/heroes/hydration_foods/hydration_food_hero.dart';
import 'package:glow_quest/domain/heroes/heroes/radiant_glow_foods/radiant_glow_food_hero.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_healthy_food_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

class HealthyFoodHeroFactory implements IHealthyFoodHeroFactory{
  @override
  IGameHero createHero(HealthyFoodType healthyFoodType) {
    switch(healthyFoodType){
      case HealthyFoodType.energyFood:
        return EnergyFoodHero();
      case HealthyFoodType.hydrationFood:
        return HydrationFoodHero();
      case HealthyFoodType.radiantglowFood:
        return RadiantGlowFoodHero();
    }
  }
}