import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_quest/presentation/quest_one/quest_one_view.dart'; // Make sure this view exists

class SubQuestSelectionView extends StatelessWidget {
  final int questId;

  const SubQuestSelectionView({Key? key, required this.questId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quest $questId Challenges'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSubQuestCard(
                title: 'Energy Boost',
                icon: Icons.flash_on,
                onTap: () {
                  // Navigate to your Energy Boost game view
                  Get.to(() => const QuestOneView()); 
                },
              ),
              _buildSubQuestCard(
                title: 'Hydration Quest',
                icon: Icons.water_drop,
                onTap: () {
                  // TODO: Navigate to your Hydration game view
                  Get.snackbar('Coming Soon', 'Hydration Quest is under development!');
                },
              ),
              _buildSubQuestCard(
                title: 'Radiant Glow',
                icon: Icons.flare,
                onTap: () {
                  // TODO: Navigate to your Radiant Glow game view
                  Get.snackbar('Coming Soon', 'Radiant Glow Quest is under development!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubQuestCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}