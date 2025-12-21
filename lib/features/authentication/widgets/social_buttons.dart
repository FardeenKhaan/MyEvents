import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/colors.dart';
import 'package:my_events/utils/constants/image_strings.dart';
import 'package:my_events/utils/constants/sizes.dart';

class FkSocialButtons extends StatelessWidget {
  const FkSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    /// Row with social media buttons
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
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
        // Facebook Button
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
