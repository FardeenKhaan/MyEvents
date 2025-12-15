import 'package:flutter/material.dart';
import 'package:my_events/common/widgets/containers/shapes/rounded_edges_container.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../circular_container.dart';

class FkPrimaryHeaderContainer extends StatelessWidget {
  const FkPrimaryHeaderContainer({super.key, required this.child, required this.height});

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return FkRoundedEdgesContainer(
      child: Container(
        height: height,
        color: FkColors.primary,
        child: Stack(
          children: [
            /// Circular Container
            Positioned(
              top: -150,
              right: -160,
              child: FkCircularContainer(
                height: FkSizes.homePrimaryHeaderHeight,
                width: FkSizes.homePrimaryHeaderHeight,
                backgroundColor: FkColors.white.withValues(alpha: 0.1),
              ),
            ),

            /// Circular Container
            Positioned(
              top: 50,
              right: -250,
              child: FkCircularContainer(
                height: FkSizes.homePrimaryHeaderHeight,
                width: FkSizes.homePrimaryHeaderHeight,
                backgroundColor: FkColors.white.withValues(alpha: 0.1),
              ),
            ),

            /// Child
            child,
          ],
        ),
      ),
    );
  }
}
