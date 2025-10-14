
import 'package:get/instance_manager.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_view_model.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_game.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_base_view_model.dart';
class EnergyBoostGame extends QuestOneBaseGame {

  @override 
  QuestOneBaseViewModel get viewModel => Get.find<EnergyBoostViewModel>();
}