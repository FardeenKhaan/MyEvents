import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';

class FkHelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static setBackButtonTwiceToExit({
    required DateTime? currentBackPressTime,
    required RxBool canPopNow,
    int requiredSeconds = 3,
  }) {
    // init current time
    DateTime now = DateTime.now();

    if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;

      FkSnackBarHelpers.successSnackBar(title: 'Exit App', message: 'Press back again to exit');

      Future.delayed(Duration(seconds: requiredSeconds), () {
        // Disable pop invoke and close the toast after 3s timeout
        canPopNow.value = false;
      });
      // Ok, let user exit app on the next back press

      canPopNow.value = true;
    }
  }

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
      case 'preparing':
        return Colors.blue;
      case 'delivered':
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
