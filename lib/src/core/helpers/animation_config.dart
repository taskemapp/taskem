import 'package:flutter/animation.dart';

abstract final class AnimationConfig {
  static const Duration duration = longDuration;
  static const Duration reverseDuration = shortDuration;

  static const Duration shortDuration = Duration(milliseconds: 200);

  static const Duration longDuration = Duration(milliseconds: 500);
  static const Curve curve = Curves.easeInOutExpo;
}
