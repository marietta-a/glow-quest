
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glow_quest/domain/models/interface/i_cooking_equipment.dart';

/// [EquipmentDesign] class applies aesthetics to the cooking equipment

abstract class IEquipmentDesign {
  /// [getCookingEquipment] method gets the equipment used for cooking
  ICookingEquipment getCookingEquipment();

  /// [color] is the color of the cooking equpiment
  late Color color;
  
  ///[size] is the size of the cooking equipment
  late double size;

  ///[setColor] method sets the color of the cooking equipment
  Color setColor(Color color);

  /// [setSize] method sets the size of the cooking equipment
  //TODO update to vectro
  double setSize(double size);

  ///[style] is the aesthetic being applied
  ICookingEquipment style();
}