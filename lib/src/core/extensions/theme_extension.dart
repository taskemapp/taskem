import 'package:flutter/material.dart';

///[ThemeData] extensions
extension ThemeExtension on ThemeData {
  ///Return true if [Brightness.dark]
  bool get isDark => brightness == Brightness.dark;
}
