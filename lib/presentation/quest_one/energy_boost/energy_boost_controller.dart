import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_healthy_food_hero_factory.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_controller.dart';

class EnergyBoostController  extends QuestOneBaseController{
 
  final IHealthyFoodHeroFactory _heroFactory;

  EnergyBoostController({
    required super.heroFactory, 
    required super.terminatorFactory, 
    required super.distractorFactory
  }) : _heroFactory = heroFactory, super();

  @override HealthyFoodType get healthyFoodType => HealthyFoodType.energyFood;

  @override void onInit() {
    super.onInit();
    super.hero = _heroFactory.createHero(HealthyFoodType.energyFood);
  }

}