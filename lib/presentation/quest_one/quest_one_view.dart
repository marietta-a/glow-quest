import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:get/get.dart';
import 'package:glow_quest/domain/heroes/avatars/avatar_hero.dart';
import 'package:glow_quest/presentation/avatar_game.dart';
import 'package:glow_quest/presentation/widgets/avatar_widget.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts

import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_game.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_controller.dart';
import 'package:glow_quest/presentation/widgets/life_bar_widget.dart';

class QuestOneView extends GetView<EnergyBoostController> {
  const QuestOneView({super.key});
  

  @override
  Widget build(BuildContext context) {
    // We create the instance of our game here.
    final game = Get.put(EnergyBoostGame()); // Using Get.put to manage the game instance
    final lifeBarWidth = MediaQuery.of(context).size.width / 4; // Made the bar a bit wider for visibility

    return Scaffold(
      // The GameWidget is the bridge between Flutter and Flame.
      body: GameWidget(
        game: game,
        // --- This is how you display Flutter UI on top of your Flame game ---
        overlayBuilderMap: {
          'scoreOverlay': (context, game) {
            // NEW: Encapsulated in a styled and animated container
            return Flexible(
              child: Row(
                children: [
                  Obx (
                    () => Align(
                      alignment: Alignment.bottomLeft,
                      child: AvatarWidget(
                        size: 100, 
                        borderWidth: 1, 
                        currentLife: controller.score.value?.toDouble() ?? 0.0,
                        maxLife: controller.winningScore.value?.toDouble() ?? 100.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft, // Centered at the top
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.cyan.withOpacity(0.7), width: 2),
                      ),
                      child: Obx(
                        () => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text(
                            //   'ENERGY',
                            //   style: GoogleFonts.pressStart2p( // Fun pixel font
                            //     color: Colors.cyan,
                            //     fontSize: 14,
                            //     letterSpacing: 2,
                            //   ),
                            // ),
                            // const SizedBox(height: 5),
                            // Animated score text
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LifeBarWidget(
                                    currentLife: controller.score.value?.toDouble() ?? 0.0,
                                    maxLife: controller.winningScore.value?.toDouble() ?? 100.0,
                                    width: lifeBarWidth,
                                ),
                                const SizedBox(width: 5),
                                // This widget animates the text change with a nice count-up/down effect
                                AnimatedCounter(
                                  value: controller.score.value ?? 0,
                                  style: GoogleFonts.bungee( // Bold, fun font
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      const Shadow(blurRadius: 10, color: Colors.cyan),
                                      const Shadow(blurRadius: 20, color: Colors.cyanAccent),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            );
          },
          'gameWonOverlay': (context, game) {
            // NEW: Using a refactored, animated overlay widget
            return _buildGameEndOverlay(
              title: controller.gameWonMessage.value ?? 'Quest Complete!',
              icon: Icons.star,
              iconColor: Colors.yellowAccent,
              buttonText: 'Continue Journey',
              onPressed: () {
                Get.toNamed("/home/quest_one");
              },
            );
          },
          'gameOverOverlay': (context, game) {
            // NEW: Reusing the same animated overlay for a consistent feel
            return _buildGameEndOverlay(
              title: controller.gameOverMessage.value ?? 'Energy Depleted!',
              icon: Icons.bolt,
              iconColor: Colors.redAccent,
              buttonText: 'Try Again',
              onPressed: () {
                // To properly restart, you should have a method in your controller/game
                // For now, we'll just go back.
                Get.back();
              },
            );
          },
        },
        // Tell the GameWidget which overlays to show when the game starts.
        initialActiveOverlays: const [
          'scoreOverlay',
        ],
      ),
    );
  }

  /// A reusable, animated widget for win/loss screens to keep code DRY.
  Widget _buildGameEndOverlay({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    // This widget smoothly fades in its child
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // This builder animates its child scaling up from small to large
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 700),
                curve: Curves.elasticOut, // A bouncy, fun curve
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Column(
                  children: [
                    Icon(icon, size: 100, color: iconColor),
                    const SizedBox(height: 24),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bungee(
                        fontSize: 48,
                        color: Colors.white,
                        shadows: [
                           Shadow(blurRadius: 15, color: iconColor),
                           Shadow(blurRadius: 25, color: iconColor.withOpacity(0.7)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // A styled, "juicy" button
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: iconColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 8,
                  shadowColor: iconColor.withOpacity(0.8),
                ),
                child: Text(
                  buttonText,
                  style: GoogleFonts.pressStart2p(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A helper widget to animate number changes smoothly.
class AnimatedCounter extends StatelessWidget {
  final int value;
  final TextStyle? style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.style,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    // This widget handles the animation from an old value to a new one
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: value, end: value), // The key is that Obx rebuilds this with a new `end` value
      duration: duration,
      builder: (context, animatedValue, child) {
        return Text(
          animatedValue.toString(),
          style: style,
        );
      },
    );
  }
}