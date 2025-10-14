import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/avatar_hero_factory.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/distractor_hero_factory.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/terminator_hero_factory.dart';
import 'package:glow_quest/domain/models/implementation/factories/heroes/healthy_food_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_avatar_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_distractor_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_terminator_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_healthy_food_hero_factory.dart';

class QuestsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IHealthyFoodHeroFactory>(() => HealthyFoodHeroFactory());
    Get.lazyPut<IDistractorHeroFactory>(() => DistractorHeroFactory());
    Get.lazyPut<ITerminatorHeroFactory>(() => TerminatorHeroFactory());
    Get.lazyPut<IAvatarHeroFactory>(() => AvatarHeroFactory());
  }
}