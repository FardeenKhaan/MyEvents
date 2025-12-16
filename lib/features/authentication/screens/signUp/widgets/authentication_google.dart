import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/image_strings.dart';

import '../../../../../../utils/constants/sizes.dart';

class AuthenticationWithGoogle extends StatelessWidget {
  final VoidCallback onPressed;

  const AuthenticationWithGoogle({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        spacing: FkSizes.spaceBtwItems / 2,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            FkImages.googleLogo,
            width: FkSizes.iconMd,
            height: FkSizes.iconMd,
            filterQuality: FilterQuality.high,
          ),
          Text('Continue with Google', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
