// A simple data class holding the character's state.
class CharacterStatsModel {
  double hydration;
  double energy;
  double skinHealth;
  int money;

  CharacterStatsModel({
    this.hydration = 80.0,
    this.energy = 75.0,
    this.skinHealth = 60.0,
    this.money = 100,
  });
}