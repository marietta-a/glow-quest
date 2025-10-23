// widgets/score_widget.dart

import 'package:flutter/material.dart';

/// A widget that displays a score icon next to a score value.
class ScoreWidget extends StatelessWidget {
  /// The score value to display.
  final int score;

  /// The path to the asset for the score icon.
  final String scoreIconAsset;

  /// The height of the widget, used to scale the icon and text.
  final double height;

  const ScoreWidget({
    super.key,
    required this.score,
    required this.scoreIconAsset,
    this.height = 45.0, // A sensible default height
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // Use a transparent container to ensure consistent hit-testing area
      children: [
        // 1. The Score Icon
        Image.asset(
          scoreIconAsset,
          height: height * 0.7, // Scale icon relative to widget height
          width: height * 0.7,
        ),
        const SizedBox(width: 8),

        // 2. The Score Text
        Text(
          '$score',
          style: TextStyle(
            color: Colors.white,
            fontSize: height * 0.5, // Scale font size relative to height
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 3.0,
                color: Colors.black54,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}