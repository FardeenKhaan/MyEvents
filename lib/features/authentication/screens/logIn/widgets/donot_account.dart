import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/routes/app_routes.dart';

import '../../../../../utils/constants/colors.dart';

class DontAccount extends StatelessWidget {
  const DontAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            // Navigate to the signup screen
            Get.toNamed(AppRoutes.signupScreen);
          },
          child: Text(
            ' Sign Up',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
