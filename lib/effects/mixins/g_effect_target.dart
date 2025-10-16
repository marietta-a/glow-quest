import 'package:glow_quest/effects/g_base_effect.dart';

mixin GEffectTarget<T> on GBaseEffect {
  /// The component that this effect is targeting.
  late T target;

  @override
  void onMount() {
    super.onMount();
    // The `parent` of an effect is the component it was added to.
    final p = parent;
    if (p is T) {
      target = p as T;
    } else {
      // This provides a clear error if you add an effect to the wrong type of component.
      throw StateError(
        'EffectTarget of type $T can only be added to a parent of type $T. '
        'Parent is of type ${p.runtimeType}.',
      );
    }
  }
}