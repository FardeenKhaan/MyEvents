
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class FkBadge extends StatelessWidget {
  const FkBadge({super.key, required this.child, required this.count});

  final Widget child;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(count.toString()),
      backgroundColor: FkColors.primary,
      isLabelVisible: count > 0,
      child: child,
    );
  }
}
