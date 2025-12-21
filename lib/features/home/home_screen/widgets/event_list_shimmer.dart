import 'package:flutter/material.dart';
import 'package:my_events/features/home/shared_widgets/event_shimmer_card.dart';

class EventListShimmer extends StatelessWidget {
  const EventListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    /// Simmer Cards Showing List
    return ListView.builder(itemCount: 9, itemBuilder: (context, index) => const EventShimmerCard());
  }
}
