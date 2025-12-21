import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/repositories/auth_repository.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/helpers/dialog_helpers.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';
import 'package:my_events/utils/storage/secure_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  // -- form GetIt as used
  final _repository = getIt<AuthRepository>();

  // -- fields setup for login
  final email = TextEditingController();
  final password = TextEditingController();

  // -- obs variables
  final rememberMe = false.obs;
  final obscurePassword = true.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  // -- login function
  Future<void> login() async {
    /// validate form credentials
    if (!formKey.currentState!.validate()) return;

    /// login process
    try {
      isLoading.value = true;

      /// call repository login
      final response = await _repository.login(email: email.text.trim(), password: password.text.trim());

      /// save token if remember me is checked
      if (rememberMe.value) {
        await SecureStorage.saveToken(response.token);
      }
      FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Login successful');

      /// Navigate to Home
      Get.offAllNamed(AppRoutes.homeScreen);
    } catch (e) {
      FkSnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // -- logout function
  Future<void> logout({bool showConfirmation = true}) async {
    try {
      if (showConfirmation) {
        final shouldLogout = await FkDialogHelpers.showLogoutConfirmation();
        if (!shouldLogout) return;
      }

      await SecureStorage.clearToken();

      // -- CLEAR STATE MANUALLY
      email.clear();
      password.clear();
      rememberMe.value = false;
      obscurePassword.value = true;
      formKey.currentState?.reset();

      Get.offAllNamed(AppRoutes.loginScreen);
    } catch (e) {
      rethrow;
    }
  }
}
