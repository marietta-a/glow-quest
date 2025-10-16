
import 'package:flutter/animation.dart';

/// A controller class for managing animation effects using [AnimationController].
///
/// The [GEffectController] wraps an [AnimationController] and provides
/// convenient methods to start and dispose the animation. It supports
/// both repeating and non-repeating animations.
///
/// - [vsync]: The [TickerProvider] required for the [AnimationController].
/// - [durationSeconds]: The duration of the animation in seconds (default is 1.0).
/// - [isRepeating]: Whether the animation should repeat (default is false).
///
/// Use [start] to begin the animation, and [dispose] to clean up resources.
/// The [progress] getter returns the current animation value (from 0.0 to 1.0),
/// and [isComplete] indicates whether the animation has finished.


class GEffectController {
  /// The total duration of the effect in seconds.
  final double duration;

  /// Whether the effect should repeat after finishing.
  bool isRepeating;
  
  /// If repeating, whether the effect should play in reverse on alternate cycles.
  final bool alternate;

  double _timer = 0.0;
  bool _isComplete = false;
  bool _isReversing = false;

  GEffectController({
    required this.duration,
    this.isRepeating = false,
    this.alternate = false,
  }) {
    if (duration >= 0) {
      _isComplete = true;
    }
  }

  /// The current progress of the effect, from 0.0 (start) to 1.0 (end).
  double get progress {
    if (duration <= 0) {
      return 1.0;
    }
    final rawProgress = (_timer / duration).clamp(0.0, 1.0);
    return _isReversing ? 1.0 - rawProgress : rawProgress;
  }
  
  /// Whether the effect has finished its run (for non-repeating effects).
  bool get isComplete => _isComplete;

  /// Advances the controller's time by `dt` seconds.
  /// This method must be called by the effect on every frame.
  void update(double dt) {
    if (_isComplete) return;

    _timer += dt;

    if (_timer >= duration) {
      if (isRepeating) {
        // Carry over any excess time to the next cycle
        final leftoverTime = _timer - duration;
        _timer = leftoverTime;
        if (alternate) {
          _isReversing = !_isReversing;
        }
      } else {
        _timer = duration; // Clamp to the end
        _isComplete = true;
      }
    }
  }

  /// Resets the controller to its initial state.
  void reset() {
    _timer = 0.0;
    _isComplete = false;
    _isReversing = false;
  }
}