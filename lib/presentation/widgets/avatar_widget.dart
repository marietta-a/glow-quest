// widgets/life_bar_avatar_widget.dart

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/heroes/avatars/avatar_hero.dart';
import 'package:glow_quest/presentation/avatar_game.dart';

/// A widget that displays the circular avatar containing a Flame game.
///
/// This widget is stateless and simply renders the container, border,
/// and the provided [AvatarGame] instance.
// ignore: must_be_immutable
class AvatarWidget extends StatefulWidget {
  /// The instance of the mini-game that controls the avatar's state.
  late AvatarGame avatarGame = AvatarGame(hero: AvatarHero());

  /// The full diameter of the avatar's circular container.
  final double size;
  final double currentLife;
  final double maxLife;

  /// The width of the border around the avatar.
  final double borderWidth;

  AvatarWidget({
    super.key,
    required this.size,
    required this.borderWidth, 
    required this.currentLife, 
    required this.maxLife,
  });
  
  @override
  State<StatefulWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget>{
  

  @override
  Widget build(BuildContext context) {
    
    // Hold an instance of our avatar
    final healthyHero = AvatarHero()..state = AvatarState.healthy;
    final sickHero = AvatarHero()..state = AvatarState.sick;
    final naturalHero = AvatarHero()..state = AvatarState.natural;
    print(widget.currentLife);

    return  switch(widget.currentLife){
      (double life) when life < 50 => Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: widget.borderWidth),
          // The background color of the avatar's "porthole"
          color: Colors.black.withOpacity(0.5),
        ),
        // ClipOval ensures the GameWidget stays within the circular bounds.
        child: ClipOval(child: GameWidget(game: widget.avatarGame = AvatarGame(hero: sickHero))),
      ),
      (double life) when life < 70 => Container(
        width: widget.size,
        height: widget.size,
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        //   border: Border.all(color: Colors.white, width: widget.borderWidth),
        //   // The background color of the avatar's "porthole"
        //   color: Colors.black.withOpacity(0.5),
        // ),
        // ClipOval ensures the GameWidget stays within the circular bounds.
        child: GameWidget(game: widget.avatarGame = AvatarGame(hero: naturalHero)),
      ),
      (_) => Container(
        width: widget.size,
        height: widget.size,
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        //   border: Border.all(color: Colors.white, width: widget.borderWidth),
        //   // The background color of the avatar's "porthole"
        //   color: Colors.black.withOpacity(0.5),
        // ),
        // ClipOval ensures the GameWidget stays within the circular bounds.
        child: GameWidget(game: widget.avatarGame = AvatarGame(hero: healthyHero)),
      ),
    };
  }
}