import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/colors.dart';
import 'package:my_events/utils/constants/image_strings.dart';
import 'package:my_events/utils/constants/sizes.dart';
import 'package:my_events/utils/constants/text_strings.dart';
import 'package:my_events/utils/device/device_utility.dart';

class FkLoginHeader extends StatelessWidget {
  const FkLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    /// container with gradient background
    return Container(
      height: FkDeviceUtils.getScreenHeight() * 0.38,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF111827), Color(0xFF1976D2), Color(0xFF2C3E50)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(FkSizes.borderRadiusLg * 2),
          bottomRight: Radius.circular(FkSizes.borderRadiusLg * 2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Logo Card
          Container(
            decoration: BoxDecoration(
              color: FkColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 6)),
              ],
            ),
            child: Image.asset(FkImages.splashLogo, height: FkSizes.iconLg * 4),
          ),

          const SizedBox(height: FkSizes.spaceBtwItems),

          /// Title
          Text(
            FkTexts.loginTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: FkColors.white, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: FkSizes.spaceBtwItems / 2),

          /// Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: FkSizes.lg),
            child: Text(
              FkTexts.loginSubTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
