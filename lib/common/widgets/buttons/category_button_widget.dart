import 'package:flutter/material.dart';
import 'package:my_events/common/widgets/containers/rounded_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({super.key, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FkRoundedContainer(
      onTap: onTap,
      radius: 1000,
      padding: EdgeInsets.symmetric(vertical: FkSizes.sm),
      animationDuration: 300,
      backgroundColor: isSelected ? FkColors.orangeGradientStart : FkColors.white,
      child: Center(
        child: Text(
          title,
          style: TextTheme.of(
            context,
          ).bodyLarge!.apply(color: isSelected ? FkColors.secondary : Colors.black, fontWeightDelta: 2),
        ),
      ),
    );
  }
}
