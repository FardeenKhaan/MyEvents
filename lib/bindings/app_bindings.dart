import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';

class AppBindings with Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), permanent: true);
  }
}
