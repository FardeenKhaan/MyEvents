
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class FkCircularLoader extends StatelessWidget {
  const FkCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: FkColors.secondary);
  }
}
