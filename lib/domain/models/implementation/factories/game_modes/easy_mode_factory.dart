import 'package:glow_quest/domain/models/implementation/factories/quest_factory.dart';
import 'package:glow_quest/domain/models/interface/factories/game_factory/i_game_factory.dart';
import 'package:glow_quest/domain/repositories/implementations/mock_food_repository.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_food_repository.dart';

/// The CONCRETE FACTORY for "Easy Mode".
/// It provides the specific implementations for this game mode.
class EasyModeGameFactory implements IGameFactory {

  @override
  IFoodRepository createFoodRepository() {
    // In a real scenario, this might be a MockFoodRepository configured
    // with foods that have higher positive effects.
    return MockFoodRepository(); 
  }

  @override
  QuestFactory createQuestFactory() {
    // This could return a specialized QuestFactory that only creates easy quests.
    return QuestFactory();
  }
}