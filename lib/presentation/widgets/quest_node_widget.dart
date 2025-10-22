import 'package:flutter/material.dart';
import 'dart:math' as math; // For the wiggle animation
import 'package:glow_quest/core/enums/quests.dart';
import 'package:glow_quest/models/quest_model.dart';

// To use a fun, custom font, add this to your pubspec.yaml:
// dependencies:
//   google_fonts: ^6.1.0
//
// And then import it here:
// import 'package:google_fonts/google_fonts.dart';

class QuestNodeWidget extends StatefulWidget {
  final QuestModel quest;
  final VoidCallback onTap;

  const QuestNodeWidget({
    super.key,
    required this.quest,
    required this.onTap,
  });

  @override
  State<QuestNodeWidget> createState() => _QuestNodeWidgetState();
}

class _QuestNodeWidgetState extends State<QuestNodeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Set up the animation controller for our "breathing" effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Create a curved animation that goes from 1.0 (normal size) to 1.1 (bigger)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // If the quest is the active one, start the animation!
    if (widget.quest.status == QuestStatus.unlocked) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define our fun styles based on the quest status
    Widget content;
    BoxDecoration decoration;

    switch (widget.quest.status) {
      // --- LOCKED STATE ---
      case QuestStatus.locked:
        content = const Icon(
          Icons.question_mark_rounded,
          color: Color(0xFFa07b58),
          size: 45,
        );
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF7d5a3c), // Wooden/Chest color
          border: Border.all(color: const Color(0xFFc7a27c), width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ],
        );
        break;

      // --- COMPLETED STATE ---
      case QuestStatus.completed:
        content = const Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 50,
        );
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          // A rewarding, shiny gold gradient
          gradient: const RadialGradient(
            colors: [
              Color(0xFFfdfc47),
              Color(0xFF24fe41),
            ],
          ),
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.7),
              blurRadius: 12,
              spreadRadius: 2,
            )
          ],
        );
        break;

      // --- UNLOCKED/ACTIVE STATE ---
      case QuestStatus.unlocked:
      default:
        content = Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.star_rounded, color: Colors.white, size: 60),
            // For a really fun font, use GoogleFonts:
            // Text(
            //   widget.quest.id.toString(),
            //   style: GoogleFonts.fredokaOne(
            //     color: const Color(0xFF6a1b9a),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 28,
            //   ),
            // ),
            Text(
              widget.quest.id.toString(),
              style: const TextStyle(
                fontFamily: 'Comic Sans MS', // A fun, commonly available fallback
                color: Color(0xFF6a1b9a),
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        );
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          // A magical, glowing purple gradient
          gradient: const RadialGradient(
            colors: [
              Color(0xFFab47bc),
              Color(0xFF6a1b9a),
            ],
          ),
          border: Border.all(color: Colors.white, width: 4),
          // A "glow" effect using shadows
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.8),
              blurRadius: 15,
              spreadRadius: 3,
            )
          ],
        );
        break;
    }

    // Use a ScaleTransition to apply our breathing animation
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 85,
          height: 85,
          decoration: decoration,
          child: Center(child: content),
        ),
      ),
    );
  }
}