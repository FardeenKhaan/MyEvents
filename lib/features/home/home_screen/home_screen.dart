import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_events/common/widgets/appbar/app_reusable_appbar.dart';
import 'package:my_events/features/authentication/controller/login/login_controller.dart';
import 'package:my_events/features/home/controller/connectivity_controller.dart';
import 'package:my_events/features/home/controller/event_controller.dart';
import 'package:my_events/features/home/home_screen/widgets/event_card.dart';
import 'package:my_events/features/home/home_screen/widgets/event_list_shimmer.dart';
import 'package:my_events/routes/app_routes.dart';
import 'package:my_events/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = EventController.instance;
    final controller = LoginController.instance;
    final connectivity = ConnectivityController.instance;
    return Scaffold(
      /// -----[AppBar]-----
      appBar: FkAppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () => controller.logout(), icon: Icon(Iconsax.logout))],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.createEvent);
        },
        child: const Icon(Icons.add),
      ),

      /// -----[Body]-----
      body: Obx(() {
        if (eventController.isLoading.value) {
          return const EventListShimmer();
        }

        /// no any event
        if (eventController.events.isEmpty) {
          return const Center(child: Text('No events found'));
        }
        return RefreshIndicator(
          onRefresh: () async {
            /// STOP refresh when offline
            if (!connectivity.isOnline.value) return;
            await eventController.fetchEvents(refresh: true);
          },

          child: Column(
            children: [
              Obx(
                () => connectivity.isOnline.value
                    ? const SizedBox()
                    : Container(
                        width: double.infinity,
                        color: Colors.red,
                        padding: const EdgeInsets.all(FkSizes.sm),
                        child: const Text(
                          'You are offline. Showing cached data.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ),

              /// Scrollable Event List
              Expanded(
                child: ListView.builder(
                  controller: eventController.scrollController,
                  itemCount: eventController.events.length + 1,
                  itemBuilder: (context, index) {
                    if (index == eventController.events.length) {
                      return eventController.isMoreLoading.value
                          ? const Padding(
                              padding: EdgeInsets.all(FkSizes.defaultSpace),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : const SizedBox();
                    }
                    final event = eventController.events[index];
                    return EventCard(event: event);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
