import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_game.dart';
import 'package:glow_quest/presentation/quest_one/energy_boost/energy_boost_controller.dart';
import 'package:glow_quest/presentation/widgets/life_bar_widget.dart';

class QuestOneView extends GetView<EnergyBoostController> {
  const QuestOneView({super.key});

  @override
  Widget build(BuildContext context) {
    // We create the instance of our game here.
    final game = EnergyBoostGame();
    final lifeBarWidth = MediaQuery.of(context).size.width / 10;

    return Scaffold(
      // The GameWidget is the bridge between Flutter and Flame.
      body: GameWidget(
        game: game,
        
        // --- This is how you display Flutter UI on top of your Flame game ---
        overlayBuilderMap: {
          'scoreOverlay': (context, game) {
            return Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                // Obx listens to reactive variables in your ViewModel
                child: Obx(() => LifeBarWidget(
                  currentLife: controller.score.value?.toDouble() ?? 0.0,
                  maxLife: controller.winningScore.value?.toDouble() ?? 100.0, 
                  width: lifeBarWidth,
                )
                //  Text(
                //       'Score: ${controller.score.value}',
                //       style: const TextStyle(
                //         fontSize: 24,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     )
                ),
              ),
            );
          },
          'gameWonOverlay': (context, game) {
            return Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                // Obx listens to the gameOverMessage
                child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.gameWonMessage.value ?? 'Game Won',
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/home/quest_one"); // go to quest one dashboard
                      },
                      child: const Text('Main Menu'),
                    ),
                  ],
                )),
              ),
            );
          },
          'gameOverOverlay': (context, game) {
            return Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                // Obx listens to the gameOverMessage
                child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.gameOverMessage.value ?? 'Game Over',
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Logic to restart the game
                        // For example, you could navigate away and back, or create a method in the ViewModel
                        Get.back(); // Simple example: go back
                      },
                      child: const Text('Main Menu'),
                    ),
                  ],
                )),
              ),
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
}