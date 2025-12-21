import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_events/routes/app_routes.dart';
import '../../utils/constants/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'By continuing you automatically agree to our ',
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: FkColors.authenticationColor.withValues(alpha: 0.7)),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.termsConditionsScreen);
              },
              child: Text(
                'terms and conditions',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: FkColors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              ' And ',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: FkColors.authenticationColor.withValues(alpha: 0.7)),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen);
              },
              child: Text(
                'Privacy Policy',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: FkColors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
