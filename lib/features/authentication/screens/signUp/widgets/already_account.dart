import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            ' Log In',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: FkColors.authenticationColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
