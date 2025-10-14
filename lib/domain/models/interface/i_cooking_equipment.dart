/// describes the equipment used in preparing for item
/// uses equipment with [name] and location [path]
/// to prepare a meal through [animate] functionality
library;

import 'package:flutter/material.dart';

abstract class ICookingEquipment {
  late String name;
  late Image image;
  late String path;
  void animate();
}