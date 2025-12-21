import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/repositories/auth_repository.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // -- form GetIt as used
  final _repository = getIt<AuthRepository>();
  // -- fields setup for login
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  // -- obs variables
  final obscurePassword = true.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  // -- signup function
  Future<void> signup() async {
    /// validate form credentials
    if (!formKey.currentState!.validate()) return;

    /// singup process
    try {
      isLoading.value = true;

      /// call repository signup
      await _repository.register(email: email.text.trim(), password: password.text.trim());
      FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Account created');
      Get.toNamed(AppRoutes.homeScreen); // Go to Login
    } catch (e) {
      FkSnackBarHelpers.errorSnackBar(title: 'Signup Failed', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
