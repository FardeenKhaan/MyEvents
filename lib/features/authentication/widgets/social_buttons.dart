import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';
import 'package:my_events/utils/constants/colors.dart';
import 'package:my_events/utils/constants/image_strings.dart';
import 'package:my_events/utils/constants/sizes.dart';

class FkSocialButtons extends StatelessWidget {
  const FkSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: FkColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(width: FkSizes.iconMd, height: FkSizes.iconMd, image: AssetImage(FkImages.googleLogo)),
          ),
        ),
        const SizedBox(width: FkSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: FkColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(width: FkSizes.iconMd, height: FkSizes.iconMd, image: AssetImage(FkImages.facebookLogo)),
          ),
        ),
      ],
    );
  }
}
