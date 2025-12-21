import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_events/features/authentication/screens/permissions/privacy_policy_screen.dart';
import 'package:my_events/features/authentication/screens/permissions/terms_conditions_screen.dart';
import 'package:my_events/features/authentication/screens/signUp/signup_screen.dart';
import 'package:my_events/features/home/create_event/create_event_screen.dart';
import 'package:my_events/features/home/event_detail/event_detail_screen.dart';
import 'package:my_events/features/home/home_screen/home_screen.dart';
import 'package:my_events/features/authentication/screens/logIn/login_screen.dart';
import 'package:my_events/features/authentication/splash/splash_screen.dart';
import 'package:my_events/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.signupScreen, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.termsConditionsScreen, page: () => const TermsConditionsScreen()),
    GetPage(name: AppRoutes.privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
    GetPage(name: AppRoutes.eventDetailScreen, page: () => EventDetailScreen()),
    GetPage(name: AppRoutes.createEvent, page: () => const CreateEditEventScreen()),
    GetPage(name: AppRoutes.editEvent, page: () => const CreateEditEventScreen()),
  ];
}
