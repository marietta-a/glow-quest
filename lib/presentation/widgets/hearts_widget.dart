// widgets/hearts_widget.dart

import 'package:flutter/material.dart';
import 'package:glow_quest/core/color_constants.dart';

/// A widget that displays a row of hearts representing player lives.
class HeartsWidget extends StatelessWidget {
  /// The number of lives the player has lost.
  final int livesLost;

  /// The total number of lives the player can have.
  final int maxLives;

  /// The height of the widget, used to scale the heart icons.
  final double height;

  const HeartsWidget({
    super.key,
    required this.livesLost,
    this.maxLives = 4,
    this.height = 45.0, // A sensible default height
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = height * 0.6; // Calculate icon size internally

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxLives, (index) {
        // A heart is FILLED if its index is less than the number of lives lost.
        final bool isFilled = index < livesLost;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Icon(
            // isFilled ? Icons.favorite : Icons.favorite_border,
            Icons.favorite,
            color: isFilled ? red : green,
            size: iconSize,
          ),
        );
      }),
    );
  }
}