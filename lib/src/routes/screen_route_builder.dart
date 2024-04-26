import 'package:taskem/src/routes/screen_route.dart';

final class ScreenRouteBuilder {
  final List<String> _parts = [];

  ScreenRouteBuilder path(ScreenRoute route) {
    _parts.add(route.path);
    return this;
  }

  ScreenRouteBuilder param<T>(T value) {
    _parts.add(value.toString());
    return this;
  }

  String build() {
    return '/' + _parts.join('/');
  }
}
