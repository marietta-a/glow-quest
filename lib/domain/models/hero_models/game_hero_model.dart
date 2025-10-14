import 'package:glow_quest/core/enums/enum.dart';
import 'package:flame/components.dart';

class GameHeroModel {
  /// [id] is the unique identifier for the hero
  String id;
  /// [name] is the name of the hero
  String  name;
  /// [description] is a brief description of the hero
  String?  description;
  /// [heroType] indicates the type of hero
  HeroType  heroType;
  String path;
  Vector2 size;

  GameHeroModel({
    required this.id,
    required this.name,
    this.description,
    required this.heroType,
    required this.path,
    required this.size,
  });
}