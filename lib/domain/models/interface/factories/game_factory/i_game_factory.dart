
import 'package:glow_quest/domain/models/implementation/factories/quest_factory.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_food_repository.dart';

/// The Game FACTORY interface.
/// Defines a contract for creating a family of related game objects.
abstract class IGameFactory {
  IFoodRepository createFoodRepository();
  QuestFactory createQuestFactory();
}