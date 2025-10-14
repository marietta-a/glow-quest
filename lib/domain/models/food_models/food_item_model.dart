/// Represents a food item and its effect on stats.
class FoodItemModel {
  final String id;
  final String name;
  final String description;
  final int cost;
  final double hydrationEffect;
  final double energyEffect;
  final double skinHealthEffect;

  FoodItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
    this.hydrationEffect = 0.0,
    this.energyEffect = 0.0,
    this.skinHealthEffect = 0.0, required int calories,
  });
}