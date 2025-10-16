import 'package:flame/components.dart';
import 'package:glow_quest/components/g_effect_component.dart';
import 'package:glow_quest/effects/g_base_effect.dart';
import 'package:glow_quest/effects/controllers/g_effect_controller.dart';
import 'package:glow_quest/effects/mixins/g_effect_target.dart';

/// An effect that creates a glowing animation by smoothly scaling and fading a target component.
/// 
/// The [GlowEffect] interpolates the scale and opacity of the target between their base values
/// and the specified [maxScale] and [minOpacity], respectively, over the duration of the effect.
/// The effect is always set to repeat.
/// 
/// - [maxScale]: The maximum scale factor to reach during the glow animation. Defaults to 1.5.
/// - [minOpacity]: The minimum opacity to reach during the glow animation. Defaults to 0.5.
/// - [controller]: The effect controller that manages the timing and repetition of the effect.
/// 
/// When the effect is attached to a target, it stores the target's original scale and opacity.
/// During each frame, it interpolates these values based on the current progress.


class GlowEffect extends GBaseEffect with GEffectTarget<GEffectComponent>{
  final double maxScale;
  final double minOpacity;
  late double _baseScale;
  late double _baseOpacity;

  GlowEffect({
    required GEffectController controller,
    this.maxScale = 1.5,
    this.minOpacity = 0.5,
  }) : super(controller) {
    // This effect should always repeat
    controller.isRepeating = true;
  }
  

  @override
  void apply(double progress) {
    // Interpolate between the base and target values using the progress
    final scaleRange = maxScale - _baseScale;
    target.scale = Vector2.all(_baseScale + (scaleRange * progress));

    final opacityRange = _baseOpacity - minOpacity;
    target.opacity = _baseOpacity - (opacityRange * progress);
  }
}