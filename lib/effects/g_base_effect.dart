import 'package:glow_quest/components/g_effect_component.dart';
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';

abstract class GBaseEffect extends GEffectComponent {
  final GEffectController controller;
  bool isComplete = false;

  GBaseEffect(this.controller);

  @override
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