import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class FkGridView extends StatelessWidget {
  const FkGridView({
    super.key,
    this.itemCount = 2,
    this.mainAxisExtent = 268,
    this.crossAxisCount = 2,
    required this.itemBuilder,
    this.physics,
    this.crossAxisSpacing = FkSizes.spaceBtwItems / 2,
    this.mainAxisSpacing = FkSizes.spaceBtwItems / 2,
    this.controller,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ScrollPhysics? physics;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: controller, // ✅ PASS CONTROLLER
        physics: physics ?? NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: mainAxisExtent,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing
        ),
        itemBuilder: itemBuilder
    );
  }
}