
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const CustomHeader({super.key, required this.title, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // -- BACK BUTTON
        if (showBackButton)
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.only(left: FkSizes.sm, top: FkSizes.xs, bottom: FkSizes.xs),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
                borderRadius: BorderRadius.circular(FkSizes.borderRadiusMd),
              ),
              child: Icon(Icons.arrow_back_ios, color: FkColors.dark),
            ),
          ),

        const SizedBox(width: FkSizes.defaultSpace / 1.5),

        /// --- TITLE
        Expanded(
          child: Center(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
