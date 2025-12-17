import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_events/features/authentication/screens/home/home_screen.dart';
import 'package:my_events/features/authentication/screens/logIn/login_screen.dart';
import 'package:my_events/features/splash/splash_screen.dart';
import 'package:my_events/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
  ];
}
