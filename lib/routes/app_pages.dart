import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_events/features/splash/splash_screen.dart';
import 'package:my_events/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    // GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    // GetPage(name: AppRoutes.navigationMenu, page: () => const NavigationMenu(), binding: NavigationBinding()),
    // GetPage(name: AppRoutes.signupScreen, page: () => SignupScreen()),
    // GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
  ];
}
