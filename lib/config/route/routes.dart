part of 'package_path.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      // Tailor Route
      case RouteNames.tailorLogin:
        return MaterialPageRoute(builder: (context) => TailorLogin());

      case RouteNames.tailorRegister:
        return MaterialPageRoute(builder: (context) => TailorRegister());

      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
