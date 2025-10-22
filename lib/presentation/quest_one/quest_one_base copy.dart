// import 'dart:math';

// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:glow_quest/core/enums/enum.dart';
// import 'package:glow_quest/components/tappable_hero_component.dart';

// abstract class QuestOneBase extends FlameGame with TapCallbacks, DragCallbacks 
// {
//   // --- Common Physics Properties ---
//   ///Initial downward speed
//   Vector2 velocity = Vector2(0, 50.0); 

//   /// Downward acceleration
//   final Vector2 gravity = Vector2(0, 100.0);

//   /// [deductionValue] is the default value subtracted when the player selects a distractor
//   int get deductionValue => 3;

//   /// [incrementValue] is the default value added when the player earns a reward
//   int get incrementValue => 5;

//   /// [winningValue] is the default score for game win when achieved
//   int get winningValue => 100;


  
//   ///[increaseScore] method increases game score
//   void increaseScore(int points);

//   ///[decreaseScore] method decreases game score
//   void decreaseScore(int penalty);

//   /// [endGame] method should be called when the game is lost
//   void endGame(String message){
      
//     /// Pause the game simulation.
//     pauseEngine();
    
//     /// Tell the GameWidget to find the builder for 'gameOverOverlay' and display it.
//     overlays.add('gameOverOverlay');
    
//     /// (Optional but recommended) Hide the score overlay so it doesn't clutter the game over screen.
//     overlays.remove('scoreOverlay');
//   }

//   void winGame(String message){
      
//     /// Pause the game simulation.
//     pauseEngine();
    
//     /// (Optional but recommended) Hide the score overlay so it doesn't clutter the game over screen.
//     overlays.remove('scoreOverlay');
    
//     /// Tell the GameWidget to find the builder for 'gameOverOverlay' and display it.
//     overlays.add('gameWonOverlay');
//   }
  

//   /// [margin] used for spawnable area calculations.
//   double margin = 0;
 
//   /// [getSpawnableWidth] method returns the width of the area where objects can be spawned, excluding a 10% margin on each side of the screen.
//   double getSpawnableWidth() {
//     final screenWidth = size.x;
//     margin = screenWidth * 0.10;
//     final spawnableWidth = screenWidth - (2 * margin);
//     return spawnableWidth;
//   }

//   TappableHeroComponent updateLocation(double dt, TappableHeroComponent hero){
    
//       // --- ACCELERATION LOGIC ---
//       // 1. Apply acceleration to velocity.
//       // This makes the object fall faster over time.
//       // velocity.y += gravity.y * dt;
//       velocity.y += dt;

//       // 2. Apply the new velocity to the position.
//       // hero.position.y += velocity.y * dt;
//       hero.position.y += velocity.y * dt;

//       hero.update(dt);
      
//       if(hero.position.y >= size.y){
//         heroesToRemove.add(hero);
//       }

//       return hero;
//   }

//   /// [heroes] is a list of point boosters in the game.
//   List<TappableHeroComponent> get heroes {
//    return allGameHeroes.where((b) => b.heroType == HeroType.hero).toList();
//   }
  
//   ///[distractors] is a list of heroes that cause point lose
//   List<TappableHeroComponent> get distractors{
//    return allGameHeroes.where((b) => b.heroType == HeroType.distractor).toList();
//   }
  
//   /// [terminators] cause the game to come to an end when selected
//   List<TappableHeroComponent> get terminators {
//    return allGameHeroes.where((b) => b.heroType == HeroType.terminator).toList();
//   }

//   /// [allGameHeroes] is a list containing all hero components in the game, including point boosters, distractors, and terminators.
//   List<TappableHeroComponent> allGameHeroes = [];

//   /// [heroesToRemove] is a list of all heroes out of the game viewport
//   List<TappableHeroComponent> heroesToRemove = [];

//   ///[getRandomPosition] Returns a random position within the allowed boundaries for the game.
//   /// Useful for spawning objects or characters at unpredictable locations.
//   /// Ensures the position is valid and does not overlap restricted areas.
//   Vector2 getRandomPosition(){
//     final Random random = Random();
//     final randomX = margin + (random.nextDouble() * getSpawnableWidth());
//     return Vector2(randomX, 0);
//   }

// }