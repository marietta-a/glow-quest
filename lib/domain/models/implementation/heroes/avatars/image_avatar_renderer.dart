import 'package:flutter/material.dart';
import 'package:glow_quest/domain/models/interface/heroes/avatars/i_avatar_renderer.dart';

/// [ImageAvatarRenderer] Implementation of IAvatarRenderer using images.
class ImageAvatarRenderer implements IAvatarRenderer {
  @override
  Widget render(double skinHealth) {
    String imagePath = 'avatar/neutral_face.png';
    if (skinHealth > 90) {
      imagePath = 'avatar/glowing_face.png';
    } else if (skinHealth > 70) {
      imagePath = 'avatar/healthy_face.png';
    }
    // In a real app, you would return Image.asset(imagePath)
    return CircleAvatar(child: Text(imagePath.split('/').last));
  }
}