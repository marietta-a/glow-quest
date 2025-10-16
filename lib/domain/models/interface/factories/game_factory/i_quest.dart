import 'package:glow_quest/domain/heroes/character_stats_model.dart';

/// The common interface for all quests.
abstract class IQuest {
  /// [title] of the quest
  String get title;

  /// [description] of the quest
  String get description;

  /// [isCompleted] checks if the quest is completed based on character stats
  bool isCompleted(CharacterStatsModel stats); 

  /// [claimReward] applies the quest reward to the character stats
  void claimReward(CharacterStatsModel stats); // Logic to give reward

  /// [isLost] checks if the quest is lost based on character stats
  bool isLost(CharacterStatsModel stats);
}