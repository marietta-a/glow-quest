import 'package:flutter/material.dart';
import 'package:glow_quest/domain/models/interface/heroes/avatars/i_avatar_renderer.dart';
/// The ABSTRACTION.
/// This class is what the UI will interact with. It delegates the
/// actual rendering work to its renderer implementation.


class CharacterAvatar {
  final IAvatarRenderer _renderer;

  CharacterAvatar({required IAvatarRenderer renderer}) : _renderer = renderer;

  // The bridge method
  Widget display(double skinHealth) {
    return _renderer.render(skinHealth);
  }
}