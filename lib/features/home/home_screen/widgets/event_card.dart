import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/models/event_model.dart';
import 'package:my_events/features/home/controller/event_controller.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/env/keys.dart';
import 'package:my_events/utils/constants/sizes.dart';
import 'package:my_events/utils/device/device_utility.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(FkSizes.defaultSpace / 2),

      /// List Tile for event details
      child: ListTile(
        /// Event Image
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(FkSizes.borderRadiusSm),
          child: CachedNetworkImage(
            imageUrl: event.image,
            width: FkDeviceUtils.getScreenWidth(context) * 0.25,
            height: FkDeviceUtils.getScreenHeight() * 0.2,
            fit: BoxFit.cover,
            placeholder: (_, __) => Center(
              child: SizedBox(
                width: FkDeviceUtils.getScreenWidth(context) * 0.03,
                height: FkDeviceUtils.getScreenHeight() * 0.02,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        ),

        /// Event Title & Details
        title: Text(event.title),
        subtitle: Text('${event.city} • ${event.date.toLocal()}'),
        onTap: () {
          /// Deeplink to event detail screen
          Get.toNamed(AppRoutes.eventDetailScreen, parameters: {FkKeys.id: event.id});
        },

        /// Favorite Button
        trailing: Obx(() {
          final isFav = EventController.instance.favoriteIds.contains(event.id);
          return IconButton(
            icon: Icon(isFav ? Icons.bookmark : Icons.bookmark_border, color: isFav ? Colors.amber : null),
            onPressed: () {
              EventController.instance.toggleFavorite(event.id);
            },
          );
        }),
      ),
    );
  }
}
