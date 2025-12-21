import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  static ConnectivityController get instance => Get.find();
  // -- obs variable
  final isOnline = false.obs;
  late StreamSubscription _subscription;

  @override
  void onInit() {
    super.onInit();

    /// initial check
    Connectivity().checkConnectivity().then((result) {
      isOnline.value = result != ConnectivityResult.none;
    });

    /// listen to changes
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      isOnline.value = result != ConnectivityResult.none;
    });
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
