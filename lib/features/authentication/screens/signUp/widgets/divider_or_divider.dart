import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: FkSizes.defaultSpace),
          child: Text(
            'OR',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
