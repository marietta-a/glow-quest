// game/avatar_game.dart
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/components/avatar_hero_component.dart';
import 'package:glow_quest/domain/heroes/avatars/avatar_hero.dart';

class AvatarGame extends FlameGame {
  // A public reference to our avatar
  final AvatarHero hero;
  late AvatarHeroComponent avatar = AvatarHeroComponent(gameHero: hero);

  AvatarGame({required this.hero});

  @override
  Color backgroundColor() => Colors.transparent; 

  @override
  Future<void> onLoad() async {
    avatar = AvatarHeroComponent(gameHero: hero);
    add(avatar);
  }

  // --- THIS IS THE KEY ---
  // This method is called whenever the GameWidget's size is determined.
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size); // It's good practice to call super.

    // 1. Set the avatar's size to be the *same as the game's canvas*.
    //    This makes it fill the entire circular space.
    avatar.size = size;

    // 2. Set the avatar's position to the center of the canvas.
    //    This works because the avatar's anchor is Anchor.center.
    avatar.position = size / 2;
  }
}