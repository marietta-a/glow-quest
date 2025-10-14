// The Factory Method for creating quests.
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/models/implementation/quests/hydration_quest.dart';
import 'package:glow_quest/domain/models/interface/factories/game_factory/i_quest.dart';

class QuestFactory {
  IQuest createQuest(QuestType type) {
    switch (type) {
      case QuestType.hydration:
        return HydrationQuest();
      // case QuestType.eatGreens:
      //   return EatGreensQuest();
      default:
        return HydrationQuest();
    }
  }
}