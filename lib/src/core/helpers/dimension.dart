import 'dart:io';

abstract class Dimension {
  static const double borderRadius = 10;

  static double get screenPadding =>
      Platform.isIOS || Platform.isAndroid ? 12 : 18;
}
