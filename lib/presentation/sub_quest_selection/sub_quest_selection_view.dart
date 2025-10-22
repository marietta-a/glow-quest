import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class SubQuestSelectionView extends StatelessWidget {
  final int questId;

  const SubQuestSelectionView({Key? key, required this.questId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Your Challenge!',
          style: GoogleFonts.fredoka(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
        alignment: Alignment.center,
        // A more vibrant and fun gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrangeAccent, Colors.amber],
          ),
        ),
        // Using a GridView to create square cards
        child: GridView.count(
          crossAxisCount: 2, // 2 cards per row
          padding: const EdgeInsets.all(20.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          
          children: [
            _buildSubQuestCard(
              title: 'Energy\nBoost',
              icon: Icons.flash_on_rounded,
              color: Colors.lightBlueAccent,
              onTap: () {
                Get.toNamed("/home/quest_one/energy_boost");
              },
            ),
            _buildSubQuestCard(
              title: 'Hydration\nQuest',
              icon: Icons.water_drop_rounded,
              color: Colors.greenAccent,
              onTap: () {
                // Fun and friendly snackbar message
                Get.snackbar(
                  'Oh no!',
                  'This adventure is still being mapped out. Check back soon!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.black54,
                  colorText: Colors.white,
                );
              },
            ),
            _buildSubQuestCard(
              title: 'Radiant\nGlow',
              icon: Icons.star_rounded, // A friendlier icon
              color: Colors.pinkAccent,
              onTap: () {
                Get.snackbar(
                  'Not Yet!',
                  'The treasure for this quest is hidden for now. Try later!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.black54,
                  colorText: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
      )
    );
  }

  /// A widget that builds a fun, colorful, and square quest card.
  Widget _buildSubQuestCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.0), // For a nice ripple effect
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Flexible(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60, // Bigger icon for more visual impact
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.fredoka( // Using our fun font
                fontSize: 22,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        )
        ),
      ),
    );
  }
}