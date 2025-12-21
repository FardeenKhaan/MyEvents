import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:my_events/routes/app_routes.dart';

import '../../../../../../utils/constants/colors.dart';

class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () =>  Get.toNamed(AppRoutes.loginScreen),
          child: Text(
            ' Log In',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
