import 'dart:io';

mixin PlatformCheck {
  bool get isCupertino => Platform.isMacOS || Platform.isIOS;
}
