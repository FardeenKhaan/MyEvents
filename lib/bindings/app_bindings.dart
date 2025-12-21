import 'package:get/get.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';
import 'package:my_events/features/home/controller/connectivity_controller.dart';
import 'package:my_events/features/home/controller/event_controller.dart';

class AppBindings with Bindings {
  @override
  void dependencies() {
    Get.put(ConnectivityController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(EventController(), permanent: true);
  }
}
