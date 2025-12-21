import 'package:flutter/material.dart';
import 'package:my_events/utils/constants/sizes.dart';
import 'package:my_events/utils/device/device_utility.dart';
import 'package:shimmer/shimmer.dart';

class EventShimmerCard extends StatelessWidget {
  const EventShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        margin: const EdgeInsets.all(FkSizes.md / 1.5),
        child: Padding(
          padding: const EdgeInsets.all(FkSizes.md / 1.5),
          child: Row(
            children: [
              Container(
                width: FkDeviceUtils.getScreenWidth(context) * 0.18,
                // width: double.infinity,
                height: FkDeviceUtils.getScreenHeight() * 0.07,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
