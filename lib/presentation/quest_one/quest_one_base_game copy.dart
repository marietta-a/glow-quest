// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/extensions.dart';
// import 'package:flame/geometry.dart'; // We need this for LineSegment
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:glow_quest/core/enums/enum.dart';
// import 'package:glow_quest/domain/heroes/heroes/quest_one_hero.dart';
// import 'package:glow_quest/components/tappable_hero_component.dart';
// import 'package:glow_quest/presentation/quest_one/quest_one_base.dart';
// import 'package:glow_quest/presentation/quest_one/quest_one_base_controller.dart';
// import 'package:glow_quest/components/slice_trail.dart';

// class QuestOneBaseGame extends QuestOneBase {
//   late QuestOneBaseController viewModel = Get.find<QuestOneBaseController>();

//   final Vector2 spriteSize = Vector2.all(100);
//   final Timer _timer = Timer(1.0, repeat: true); 
//   late double screenWidth = 0;
//   late double spawnableWidth = 0;
  
//   SliceTrail? _currentSlice;
//   Vector2? _lastDragPosition;

//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//     viewModel.winningScore.value = winningValue;
//     _timer.onTick = spawnObject;

//     final background = SpriteComponent()
//       ..sprite = await Sprite.load('backgrounds/quest_one_background.jpg')
//       ..size = canvasSize
//       ..priority = -1;
//     add(background);
//   }
  
//   @override
//   void onDragStart(DragStartEvent event) {
//     super.onDragStart(event);
//     _currentSlice = SliceTrail();
//     add(_currentSlice!);
//     _currentSlice!.addPoint(event.localPosition);
//     _lastDragPosition = event.localPosition;
//   }
  
//   // --- CORRECTED onDragUpdate METHOD ---
//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     super.onDragUpdate(event);
//     _currentSlice?.addPoint(event.localEndPosition);

//     final dragLine = LineSegment(_lastDragPosition!, event.localEndPosition);
    
//     // Iterate over a copy to avoid modification errors during the loop
//     final heroes = children.whereType<QuestOneHero>().toList();
//     for (final hero in heroes) {
//       final heroRect = hero.toRect();

//       // Deconstruct the hero's rectangle into four line segments
//       final top = LineSegment(heroRect.topLeft.toVector2(), heroRect.topRight.toVector2());
//       final right = LineSegment(heroRect.topRight.toVector2(), heroRect.bottomRight.toVector2());
//       final bottom = LineSegment(heroRect.bottomRight.toVector2(), heroRect.bottomLeft.toVector2());
//       final left = LineSegment(heroRect.bottomLeft.toVector2(), heroRect.topLeft.toVector2());

//       // Check for intersection with any of the four sides.
//       // We also check if the drag started or ended inside the hero,
//       // which handles quick taps or short drags entirely within the component.
//       if (heroRect.contains(Offset(dragLine.from.x, dragLine.from.y)) ||
//           heroRect.contains(Offset(dragLine.to.x, dragLine.to.y)) ||
//           dragLine.intersections(top).isNotEmpty ||
//           dragLine.intersections(right).isNotEmpty ||
//           dragLine.intersections(bottom).isNotEmpty ||
//           dragLine.intersections(left).isNotEmpty) {
        
//         // If there's an intersection, slice the hero.
//         hero.slice();
//       }
//     }

//     _lastDragPosition = event.localEndPosition;
//   }
  
//   @override
//   void onDragEnd(DragEndEvent event) {
//     super.onDragEnd(event);
//     _currentSlice = null;
//     _lastDragPosition = null;
//   }

//   @override
//   void onDragCancel(DragCancelEvent event) {
//     super.onDragCancel(event);
//     _currentSlice = null;
//     _lastDragPosition = null;
//   }
  
//   // --- No other changes are needed below this line ---

//   @override
//   Color backgroundColor() => const Color(0xFF1E1E2E); 

//   @override
//   void update(double dt) {
//     super.update(dt);
//     _timer.update(dt); 

//     allGameHeroes = children.whereType<TappableHeroComponent>()
//                     .map((b) => updateLocation(dt, b))
//                     .toList();

//     removeHeroesInactiveHeroes();
  
//     checkGameState();
//   }

//   @override
//   int get winningValue => 100;

//   List<TappableHeroComponent> getInActiveHeroes(){
//     return allGameHeroes.where((b) => b.position.y >= size.y)
//                  .map((b) => decreaseScoreForLostHero(b))
//                  .toList();
//   }


//   void removeHeroesInactiveHeroes() {
//     if(getInActiveHeroes().isNotEmpty){
//       removeAll(getInActiveHeroes());
//     }
//   }

//   TappableHeroComponent decreaseScoreForLostHero(TappableHeroComponent hero){
//     if(hero.heroType == HeroType.hero){
//       viewModel.decreaseScore(1);
//     }
//     return hero;
//   }
  
  
//   Future<void> spawnObject() async {
//     await addHero();
//     await addDistractor();
//     await addTerminator();
//   }
  

  
//   Future<void> addHero() async {
//    add(QuestOneHero(
//         gameHero: viewModel.hero, 
//         onSelect: onTapDown, 
//         heroType: HeroType.hero, 
//       )
//       ..size = viewModel.hero.size
//     );
//   }
  
//   Future<void> addDistractor() async {
//     if(heroes.length >= 2){
//       add(QuestOneHero(
//           gameHero: viewModel.distractor, 
//           onSelect: onTapDown, 
//           heroType: HeroType.distractor, 
//         )
//         ..size = viewModel.hero.size
//       );
//     }
//   }
  
//   Future<void> addTerminator() async {
//     if(distractors.length >= 2){
//       add(QuestOneHero(
//           gameHero: viewModel.terminator, 
//           onSelect: onTapDown, 
//           heroType: HeroType.terminator, 
//         )
//         ..size = viewModel.hero.size
//         ..anchor = Anchor.center
//       );
//     }
//   }


//   // --- Public methods for components to call ---
//   @override
//   void increaseScore(int points) {
//     viewModel.increaseScore(points);
//   }

//   @override
//   void decreaseScore(int penalty) {
//     viewModel.decreaseScore(penalty);
//   }

//   @override
//   void endGame(String message) {
//     viewModel.endGame(message);
//     super.endGame(message);
//   }

//   @override
//   void winGame(String message) {
//     viewModel.winGame(message);
//     super.winGame(message);
//   }
  
//   void updateGameState(TappableHeroComponent hero) {
//     switch(hero.heroType){
//       case HeroType.hero:
//         viewModel.increaseScore(incrementValue);
//       break;
//       case HeroType.avatar:
      
//         break;
//       case HeroType.distractor:
//         viewModel.decreaseScore(deductionValue);
//       break;
//       case HeroType.terminator:
//         endGame("You selected a harzardouse item");
//       break;
//     }
//   }
  
//   void checkForGameOver() {
//     if (viewModel.score.value! < 0  ) {
//       endGame(viewModel.gameOverMessage.value ?? "Game Over");
//     }
//   }
  
//   void checkForGameWon() {
//     if (viewModel.score.value! >=  winningValue  ) {
//       winGame(viewModel.gameWonMessage.value ?? "Game Won");
//     }
//   }
  
//   void checkGameState() {
//     checkForGameOver();
//     checkForGameWon();
//   }
  
//   // void addAvatar() {
//   //   final hero = AvatarHero();
//   //   hero.state = AvatarState.sick;
//   //   hero.type = AvatarType.blackWoman;
//   //   add(
//   //     AvatartHeroComponent(
//   //       gameHero: hero,
//   //     )
//   //     ..anchor = Anchor.bottomLeft
//   //     ..position = Vector2(60, 60)
//   //   );
//   // }
// }