import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_events/features/authentication/controller/signup/signup_controller.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/constants/text_strings.dart';
import '../../../../../../common/widgets/buttons/feature_provider_button.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validators.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          /// First Name & Last Name
          Row(
            children: [
              /// First Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'First Name', prefixIcon: Icon(Iconsax.user)),
                  controller: controller.firstName,
                  validator: (value) => FkValidator.validateEmptyText('First Name', value),
                ),
              ),
              SizedBox(width: FkSizes.spaceBtwItems / 2),

              /// Last Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                  controller: controller.lastName,
                  validator: (value) => FkValidator.validateEmptyText('Last Name', value),
                ),
              ),
            ],
          ),

          SizedBox(height: FkSizes.spaceBtwItems),

          /// Email Field
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
            controller: controller.email,
            validator: (value) => FkValidator.validateEmail(value),
          ),
          SizedBox(height: FkSizes.spaceBtwItems),

          /// Phone Number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Phone Number', prefixIcon: Icon(Iconsax.call)),
            controller: controller.phoneNumber,
            validator: (value) => FkValidator.validateEmptyText('Phone Number', value),
          ),
          SizedBox(height: FkSizes.spaceBtwItems),

          /// Password Field
          Obx(
            () => TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: controller.password,
              obscureText: controller.obscurePassword.value,
              validator: (value) => FkValidator.validateEmptyText('Password', value),
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
            ),
          ),
          SizedBox(height: FkSizes.spaceBtwItems * 2),

          /// --- SignUP Button
          Obx(
            () => Center(
              child: FkElevatedButton(
                width: double.infinity,
                text: "Sign Up",
                isLoading: controller.isLoading.value,
                onPressed: controller.signup,
              ),
            ),
          ),
          SizedBox(height: FkSizes.spaceBtwSections),

          /// Already Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.toNamed(AppRoutes.loginScreen),
              child: const Text(FkTexts.alreadyHaveAnAccount),
            ),
          ),
        ],
      ),
    );
  }
}
