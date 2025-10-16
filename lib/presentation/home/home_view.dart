import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_quest/presentation/home/home_controller.dart';
import 'package:glow_quest/presentation/widgets/path_painter_widget.dart';
import 'package:glow_quest/presentation/widgets/quest_node_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Manually put the controller since this is the first screen.
    // In a real app, you would have bindings.
    Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          // Layer 1: The background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6A1B9A), Color(0xFF311B92)],
              ),
            ),
          ),

          // Layer 2: The scrollable map content
          SingleChildScrollView(
            reverse: true, // Start scrolled at the bottom
            child: SizedBox(
              // The map needs a fixed, tall height to be scrollable
              height: 1200, 
              width: double.infinity,
              child: Stack(
                children: [
                  // The winding path
                  CustomPaint(
                    size: const Size(double.infinity, double.infinity),
                    painter: PathPainterWidget(),
                  ),

                  // The quest nodes, positioned on top of the path
                  Positioned(
                    bottom: 100,
                    left: MediaQuery.of(context).size.width * 0.5 - 40,
                    child: Obx(() => QuestNodeWidget(
                      quest: controller.quests[0],
                      onTap: () => controller.selectQuest(controller.quests[0]),
                    )),
                  ),
                  Positioned(
                    bottom: 400,
                    left: MediaQuery.of(context).size.width * 0.5 - 40,
                    child: Obx(() => QuestNodeWidget(
                      quest: controller.quests[1],
                      onTap: () => controller.selectQuest(controller.quests[1]),
                    )),
                  ),
                   Positioned(
                    bottom: 700,
                    left: MediaQuery.of(context).size.width * 0.5 - 40,
                    child: Obx(() => QuestNodeWidget(
                      quest: controller.quests[2],
                      onTap: () => controller.selectQuest(controller.quests[2]),
                    )),
                  ),
                  Positioned(
                    bottom: 1000,
                    left: MediaQuery.of(context).size.width * 0.5 - 40,
                    child: Obx(() => QuestNodeWidget(
                      quest: controller.quests[3],
                      onTap: () => controller.selectQuest(controller.quests[3]),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}