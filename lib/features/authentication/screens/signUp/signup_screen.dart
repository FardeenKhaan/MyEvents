import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/features/authentication/controller/signup/signup_controller.dart';
import 'package:my_events/features/authentication/screens/signUp/widgets/signup_form.dart';
import 'package:my_events/features/authentication/widgets/form_divider.dart';
import 'package:my_events/features/authentication/widgets/social_buttons.dart';
import 'package:my_events/utils/constants/text_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(FkTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: FkSizes.spaceBtwSections),

              /// Form
              const SignupForm(),

              /// Divider
              FkFormDivider(dividerText: FkTexts.orSignUpWith.capitalize!),
              const SizedBox(height: FkSizes.spaceBtwSections),

              /// Social Buttons
              const FkSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
