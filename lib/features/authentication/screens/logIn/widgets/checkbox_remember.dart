import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';

import '../../../../../utils/constants/colors.dart';

class CheckboxRemember extends StatelessWidget {
  const CheckboxRemember({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Row(
      children: [
        /// Checkbox for tap
        Obx(
          () => Checkbox(
            value: controller.rememberMe.value,
            onChanged: (value) {
              controller.rememberMe.value = value ?? false;
            },
          ),
        ),

        /// --- Read text
        Text(
          'Remember Me',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor),
        ),
      ],
    );
  }
}
