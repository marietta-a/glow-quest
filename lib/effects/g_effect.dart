import 'package:glow_quest/components/g_effect_component.dart';
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';

/// An abstract base class for creating effects that can be applied to an [GEffectComponent].
///
/// [GBaseEffect] uses an [GEffectController] to manage the timing and progress of the effect.
/// Subclasses should implement the [apply] method to define how the effect modifies the target
/// component based on the controller's progress.
///
/// The effect tracks its completion status with [isComplete], which is set when the controller
/// finishes and is not repeating. The [update] method should be called regularly (e.g., every frame)
/// to update the effect's state and apply changes.
///
/// Example usage:
/// ```dart
/// class FadeEffect extends BaseEffect {
///   FadeEffect(EffectController controller) : super(controller);
///
///   @override
///   void apply(double progress) {
///     // Custom effect logic here
///   }
/// }
/// ```
abstract class GEffect {
  final GEffectController controller;
  bool isComplete = false;

  GEffect(this.controller);

  void update(double dt) {
    // Let the component know the effect is done
    if (controller.isComplete && !controller.isRepeating) {
      isComplete = true;
    }
    // Apply the change based on the controller's progress
    apply(controller.progress);
  }

  // This is where subclasses will do their magic
  void apply(double progress);
}