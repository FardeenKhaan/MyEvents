import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/constants/text_strings.dart';
import '../../../../../common/widgets/buttons/feature_provider_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';
import 'checkbox_remember.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: InputDecoration(hintText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
            controller: controller.email,
            validator: (value) => FkValidator.validateEmptyText('email is required', value),
          ),
          SizedBox(height: FkSizes.spaceBtwItems),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.obscurePassword.value,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Iconsax.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.obscurePassword.value = !controller.obscurePassword.value;
                  },
                  child: Icon(controller.obscurePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
              validator: (value) => FkValidator.validateEmptyText('password is required', value),
            ),
          ),
          SizedBox(height: FkSizes.spaceBtwItems / 2),

          /// Remember Me Checkbox
          CheckboxRemember(),
          SizedBox(height: FkSizes.spaceBtwItems * 2),

          /// Login Button
          Obx(
            () => Center(
              child: FkElevatedButton(
                text: "Log In",
                width: double.infinity,
                isLoading: controller.isLoading.value,
                onPressed: controller.login,
              ),
            ),
          ),
          SizedBox(height: FkSizes.spaceBtwSections),

          /// Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.toNamed(AppRoutes.signupScreen),
              child: const Text(FkTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
