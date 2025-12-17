import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/repositories/auth_repository.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/storage/secure_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final AuthRepository _repo = AuthRepository();

  final email = TextEditingController();
  final password = TextEditingController();

  final rememberMe = false.obs;
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final response = await _repo.login(email: email.text.trim(), password: password.text.trim());

      if (rememberMe.value) {
        await SecureStorage.saveToken(response.token);
      }

      Get.snackbar('Success', 'Login successful');
      // Navigate to Home
      Get.offAllNamed(AppRoutes.homeScreen);
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await SecureStorage.clearToken();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
