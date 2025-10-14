
import 'package:glow_quest/domain/models/food_models/food_item_model.dart';
import 'package:glow_quest/domain/repositories/interfaces/i_food_repository.dart';

/// This [MockFoodRepository] implements the contract defined by IFoodRepository.
class MockFoodRepository implements IFoodRepository {
  // ... (the list of foods)

  @override // This method is required by the interface
  Future<List<FoodItemModel>> getAllFoods() async {
    return [
      FoodItemModel(id: '1', name: 'Apple', calories: 95, description: '', cost: 250,
                    skinHealthEffect: 5, hydrationEffect: 2, energyEffect: 10),
      FoodItemModel(id: '2', name: 'Banana', calories: 105, description: '', cost: 100,
                    skinHealthEffect: 3, hydrationEffect: 1, energyEffect: 15),
      FoodItemModel(id: '3', name: 'Carrot', calories: 25, description: '', cost: 500,
                    skinHealthEffect: 7, hydrationEffect: 3, energyEffect: 5),
    ];
  }

  @override // This method is also required by the interface
  Future<FoodItemModel?> getFoodById(String id) async {
    var foods = await getAllFoods();
    try {
      return foods.firstWhere((food) => food.id == id);
    } catch (e) {
      return null;
    }
  }
}

