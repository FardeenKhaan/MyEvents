import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/helpers/snackbar_helpers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  // final _repository = Get.put(AuthenticationRepository());

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // start loading
      isLoading.value = true;

      // form validation
      if (!formKey.currentState!.validate()) return;

      // UserModel user = UserModel(
      //   email: email.text.trim(),
      //   firstName: firstName.text.trim(),
      //   lastName: lastName.text.trim(),
      //   phone: phoneNumber.text.trim(),
      // );

      // // login the user
      // UserModel newUser = await _repository.signupUser(user, password.text.trim());
      // if(newUser.id.isNotEmpty){

      //   // save user into local
      //   getIt<UserSession>().saveUser(newUser);

      //   // redirect to home
      //   Get.offAllNamed(AppRoutes.navigationMenu);
      // }
    } catch (e) {
      FkSnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
