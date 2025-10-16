
import 'package:glow_quest/domain/heroes/character_stats_model.dart';
import 'package:glow_quest/domain/models/interface/factories/game_factory/i_quest.dart';

/// [HydrationQuest] is a Concrete implementations of quests.
class HydrationQuest implements IQuest {
  @override
  String get title => "Hydration Challenge";
  @override
  String get description => "Drink enough to reach 90 hydration.";
  
  @override
  bool isCompleted(CharacterStatsModel stats) => stats.hydration >= 90;

  @override
  void claimReward(CharacterStatsModel stats) {
    stats.money += 10;
  }
  
  @override
  bool isLost(CharacterStatsModel stats){
    return stats.hydration <= 0 || stats.energy <= 0 || stats.skinHealth <= 0 ;
  }
}

// You could add many more, like EatGreensQuest, NoSugarQuest, etc.