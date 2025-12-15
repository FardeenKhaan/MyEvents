
import 'package:flutter/material.dart';

import '../clipper/custom_rounded_clipper.dart';

class FkRoundedEdgesContainer extends StatelessWidget {
  const FkRoundedEdgesContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FkCustomRoundedEdges(),
      child: child,
    );
  }
}
