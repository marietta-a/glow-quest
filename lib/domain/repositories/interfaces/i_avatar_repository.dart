
import 'package:glow_quest/domain/repositories/interfaces/i_game_hero_repository.dart';

/// This is the contract that all food repositories must follow.
/// The ViewModel will depend on this abstract class, not any concrete implementation.
/// This is the core of the Dependency Inversion Principle (SOLID).
abstract class IAvatarRepository implements IGameHeroRepository {
}