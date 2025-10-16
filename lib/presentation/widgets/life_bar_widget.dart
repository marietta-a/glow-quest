import 'package:flutter/material.dart';

/// A widget that displays a life bar with dynamic colors based on its value.
///
/// This widget is stateless and will rebuild to show the correct color and fill
/// whenever the `currentLife` value changes.
class LifeBarWidget extends StatelessWidget {
  /// The current life value to display.
  final double currentLife;

  /// The maximum possible life value, representing a full bar.
  final double maxLife;

  /// The height of the life bar.
  final double height;
  final double width;

  /// The width of the border around the life bar.
  final double borderWidth;

  const LifeBarWidget({
    super.key,
    required this.currentLife,
    this.maxLife = 100.0,
    this.height = 25.0,
    required this.width,
    this.borderWidth = 2.0,
  });

  /// A helper method to determine the bar's color based on the life percentage.
  Color _getBarColor(double percentage) {
    if (percentage < 0.25) {
      return Colors.redAccent; // < 25%
    } else if (percentage < 0.50) {
      return Colors.orangeAccent; // 25% to < 50%
    } else if (percentage < 0.75) {
      return Colors.yellowAccent; // 50% to < 75%
    } else {
      return Colors.greenAccent; // 75% upwards
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a LayoutBuilder to get the available width for the bar.
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1. Calculate the percentage, ensuring it's between 0.0 and 1.0.
        final double percentage = (currentLife / maxLife).clamp(0.0, 1.0);
        final double barWidth = width * percentage;

        // 2. Determine the color for the current life value.
        final Color barColor = _getBarColor(percentage);
        
        // Define the rounded corners for a nicer look.
        final BorderRadius borderRadius = BorderRadius.circular(height / 2);

        return SizedBox(
          height: height,
          width: width,
          // A Stack is perfect for layering the background, bar, and border.
          // It's like a sandwich: the background is the bottom slice of bread,
          // the life bar is the filling, and the border is the top slice.
          child: Stack(
            children: [
              // --- Layer 1: The Background ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  // borderRadius: borderRadius,
                ),
              ),
              
              // --- Layer 2: The Life Bar (Fill) ---
              // AnimatedContainer will smoothly transition the width and color changes.
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                width: barWidth,
                decoration: BoxDecoration(
                  color: barColor,
                  // borderRadius: borderRadius,
                ),
              ),

              // --- Layer 3: The Border ---
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: borderWidth,
                  ),
                  // borderRadius: borderRadius,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}