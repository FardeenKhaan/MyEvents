import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';
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
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            // padding: FkSpacingStyle.paddingWithAppBarHeight,
            padding: EdgeInsets.all(FkSizes.defaultSpace),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo , Title And Subtitle
                const FkLoginHeader(),

                /// Form
                const LoginForm(),

                /// Divider
                FkFormDivider(dividerText: FkTexts.orSignInWith.capitalize!),
                const SizedBox(height: FkSizes.spaceBtwSections),

                /// Footer
                const FkSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
