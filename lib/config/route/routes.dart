part of 'package_path.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final isTailor = settings.arguments;
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

      // Auth Routes
      case RouteNames.authScreenController:
        return MaterialPageRoute(builder: (context) => AuthScreensController(isTailor: isTailor as bool,));
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => LoginScreen(isTailor: isTailor  as bool,));
      case RouteNames.register:
        return MaterialPageRoute(builder: (context) => RegisterScreen(isTailor: isTailor as bool,));

      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
