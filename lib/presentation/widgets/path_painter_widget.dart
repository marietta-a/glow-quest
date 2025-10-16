import 'package:flutter/material.dart';

class PathPainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 17.0
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    final path = Path();
    // Start the path from the bottom, heading up
    path.moveTo(size.width * 0.5, size.height - 100);
    
    // Create a winding path using quadratic Bezier curves
    // A quadratic curve needs a control point (x1, y1) and an end point (x2, y2)
    path.quadraticBezierTo(size.width * 0.9, size.height - 250, size.width * 0.5, size.height - 400);
    path.quadraticBezierTo(size.width * 0.1, size.height - 550, size.width * 0.5, size.height - 700);
    path.quadraticBezierTo(size.width * 0.9, size.height - 850, size.width * 0.5, size.height - 1000);
    // Add more curves to extend the path

    // Draw the shadow first
    canvas.drawPath(path, shadowPaint);
    // Draw the main path on top
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}