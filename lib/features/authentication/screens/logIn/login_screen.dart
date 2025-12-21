import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/features/authentication/screens/logIn/widgets/login_form.dart';
import 'package:my_events/features/authentication/screens/logIn/widgets/login_header.dart';
import 'package:my_events/features/authentication/widgets/form_divider.dart';
import 'package:my_events/features/authentication/widgets/social_buttons.dart';
import 'package:my_events/utils/constants/text_strings.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const FkLoginHeader(),

            /// Form Section
            Padding(
              padding: const EdgeInsets.all(FkSizes.defaultSpace),
              child: Column(
                children: [
                  SizedBox(height: FkSizes.spaceBtwItems),

                  /// textFields & button
                  const LoginForm(),
                  const SizedBox(height: FkSizes.spaceBtwSections),

                  /// Form Divider
                  FkFormDivider(dividerText: FkTexts.orSignInWith.capitalize!),
                  const SizedBox(height: FkSizes.spaceBtwSections),

                  /// Social Buttons as static for now
                  const FkSocialButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
