
import 'package:glow_quest/domain/models/food_models/food_item_model.dart';

/// This is the contract that all food repositories must follow.
/// The ViewModel will depend on this abstract class, not any concrete implementation.
/// This is the core of the Dependency Inversion Principle (SOLID).
abstract class IFoodRepository {
  /// Fetches a list of all available food items.
  Future<List<FoodItemModel>> getAllFoods();

  /// Fetches a single food item by its unique ID.
  /// Returns null if no food is found.
  Future<FoodItemModel?> getFoodById(String id);
}