// life_bar_widget.dart

import 'package:flutter/material.dart';
// Import the new, smaller widgets
import 'score_widget.dart';
import 'hearts_widget.dart';

/// A container widget that arranges a ScoreWidget and a HeartsWidget
/// into a game HUD layout.
class LifeBarWidget extends StatelessWidget {
  final int score;
  final int livesLost;
  final int maxLives;
  final double height;
  final String scoreIconAsset;

  const LifeBarWidget({
    super.key,
    required this.score,
    required this.livesLost,
    this.maxLives = 4,
    this.height = 45.0,
    required this.scoreIconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: height * 0.3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(
          color: Colors.white.withOpacity(0.7),
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          // --- Left Side: Use the ScoreWidget ---
          ScoreWidget(
            score: score,
            scoreIconAsset: scoreIconAsset,
            height: height,
          ),
          
          const Spacer(), // Pushes them to the edges
          
          // --- Right Side: Use the HeartsWidget ---
          HeartsWidget(
            livesLost: livesLost,
            maxLives: maxLives,
            height: height,
          ),
        ],
      ),
    );
  }
}