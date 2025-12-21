import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/common/widgets/appbar/app_reusable_appbar.dart';
import 'package:my_events/common/widgets/buttons/feature_provider_button.dart';
import 'package:my_events/features/home/controller/event_detail_controller.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/constants/sizes.dart';
import 'package:my_events/utils/device/device_utility.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventDetailController());

    return Scaffold(
      /// -----[AppBar]-----
      appBar: FkAppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final event = controller.event.value;

              if (event == null) return;

              Get.toNamed(AppRoutes.editEvent, parameters: {'id': event.id}, arguments: event);
            },
          ),
        ],
      ),

      /// -----[Body]-----
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final event = controller.event.value;
        if (event == null) {
          return const Center(child: Text('Event data not available offline'));
        }

        /// Event Details
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(FkSizes.borderRadiusLg),
                  bottomRight: Radius.circular(FkSizes.borderRadiusLg),
                ),
                child: CachedNetworkImage(
                  imageUrl: event.image.startsWith('http') ? event.image : 'https://picsum.photos/600',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Center(
                    child: SizedBox(
                      width: FkDeviceUtils.getScreenWidth(context) * 0.07,
                      height: FkDeviceUtils.getScreenHeight() * 0.06,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(FkSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${event.title}',
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: FkSizes.spaceBtwItems / 2),
                    Text('City: ${event.city}', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: FkSizes.spaceBtwItems / 1.5),
                    Text(
                      'Description: ${event.description}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: FkSizes.spaceBtwSections),

                    // Obx(
                    //   () => SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       onPressed: controller.isRegistering.value ? null : controller.registerEvent,
                    //       child: controller.isRegistering.value
                    //           ? SizedBox(
                    //               height: FkDeviceUtils.getScreenHeight() * 0.025,
                    //               width: FkDeviceUtils.getScreenWidth(context) * 0.05,
                    //               child: const CircularProgressIndicator(strokeWidth: 2),
                    //             )
                    //           : const Text('Register'),
                    //     ),
                    //   ),
                    // ),
                    /// Register Button
                    Obx(
                      () => Center(
                        child: FkElevatedButton(
                          width: double.infinity,
                          text: "Register",
                          isLoading: controller.isLoading.value,
                          onPressed: controller.isRegistering.value ? null : controller.registerEvent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
