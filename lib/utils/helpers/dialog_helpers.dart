import 'package:get/get.dart';
import '../../common/widgets/dialog/lougout_alert_dialog.dart';

class FkDialogHelpers {
  /// Dialog Before Logout
  static Future<bool> showLogoutConfirmation() async {
    final result = await Get.dialog(LogoutAlertDialog(), barrierDismissible: false);

    return result ?? false;
  }
}
