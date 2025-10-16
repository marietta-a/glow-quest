
import 'package:get/instance_manager.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_controller.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_game.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_controller.dart';
class EnergyBoostGame extends QuestOneBaseGame {

  @override 
  QuestOneBaseController get viewModel => Get.find<EnergyBoostController>();
}