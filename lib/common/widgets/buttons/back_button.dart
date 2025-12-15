
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FkBackButton extends StatelessWidget {
  const FkBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.only(left: FkSizes.sm, top: FkSizes.xs, bottom: FkSizes.xs),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))],
          borderRadius: BorderRadius.circular(FkSizes.borderRadiusMd),
        ),
        child: Icon(Icons.arrow_back_ios, color: FkColors.dark),
      ),
    );
  }
}