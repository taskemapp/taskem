/// The [ScreenRoute] class represents a model
/// for defining routes in the application.
final class ScreenRoute {
  ///Constructor
  ScreenRoute({
    required this.name,
    required this.path,
    required this.goPath,
  });

  ///Route name
  final String name;

  ///Route path
  final String path;

  ///Path in [GoRoute] path
  final String goPath;
}
