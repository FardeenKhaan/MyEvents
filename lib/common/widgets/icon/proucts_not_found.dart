import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FkProductsNotFound extends StatelessWidget {
  const FkProductsNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.box, size: FkSizes.iconLg * 4, color: FkColors.dark.withValues(alpha: 0.5)),
          Text("Product not found", style: TextTheme.of(context).bodyLarge),
        ],
      ),
    );
  }
}