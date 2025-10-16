import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/distractor_hero_factory.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/terminator_hero_factory.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/healthy_food_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_healthy_food_hero_factory.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_controller.dart';
import 'package:glow_quest/presentation/quest_one/quests_base_binding.dart';

class EnergyBoostBinding extends QuestsBinding{
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<IHealthyFoodHeroFactory>(() => HealthyFoodHeroFactory());
    Get.lazyPut(() => EnergyBoostController(
      heroFactory: HealthyFoodHeroFactory(), 
      terminatorFactory: TerminatorHeroFactory(), 
      distractorFactory: DistractorHeroFactory())
    );
  }
}