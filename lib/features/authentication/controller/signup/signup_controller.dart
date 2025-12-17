import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/repositories/auth_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final AuthRepository _repo = AuthRepository();

  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      await _repo.register(email: email.text.trim(), password: password.text.trim());

      Get.snackbar('Success', 'Account created');
      Get.back(); // Go to Login
    } catch (e) {
      Get.snackbar('Signup Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
