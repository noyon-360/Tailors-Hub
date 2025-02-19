part of 'package_path.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // Home Screen
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => Home());
      // Onboarding
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
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
