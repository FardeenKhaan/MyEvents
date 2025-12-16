import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/image_strings.dart';
import 'package:my_events/utils/constants/sizes.dart';
import 'package:my_events/utils/constants/text_strings.dart';

class FkLoginHeader extends StatelessWidget {
  const FkLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 200, image: AssetImage(FkImages.splashLogo)),
        const SizedBox(height: FkSizes.spaceBtwItems),
        Text(FkTexts.loginTitle, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: FkSizes.sm),
        Text(FkTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
