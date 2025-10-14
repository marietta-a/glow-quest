import 'package:flutter/material.dart';

// The IMPLEMENTATION interface.
// Defines how to render an avatar based on skin health.
abstract class IAvatarRenderer {
  Widget render(double skinHealth);
}