import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FkDeviceUtils {
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // // Add more device utility methods as per your specific requirements.
}
