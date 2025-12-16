import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';
import '../../../../utils/constants/keys.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  // final _repository = Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;
  RxBool rememberMe = false.obs;
  // final localStorage = FkLocalStorage.appStorage;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // email.text = localStorage.read(FkKeys.rememberMeEmail) ?? '';
    // password.text = localStorage.read(FkKeys.rememberMePassword) ?? '';
    super.onInit();
  }

  /// [Login]
  Future<void> login() async {
    try {
      // start loading
      isLoading.value = true;

      // form validation
      if (!formKey.currentState!.validate()) return;

      // Save Data if remember me is checked
      // if(rememberMe.value){
      //   localStorage.write(FkKeys.rememberMeEmail, email.text.trim());
      //   localStorage.write(FkKeys.rememberMePassword, password.text.trim());
      // }

      // // login the user
      // UserModel user = await _repository.loginUser(email.text.trim(), password.text.trim());
      // if(user.id.isNotEmpty){

      //   // save user into local
      //   await getIt<UserSession>().saveUser(user);

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
