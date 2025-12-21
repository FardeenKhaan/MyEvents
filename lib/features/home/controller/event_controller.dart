import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_events/data/models/event_model.dart';
import 'package:my_events/data/repositories/event_repository.dart';
import 'package:my_events/data/services/favourite/favourite_service.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/features/home/controller/connectivity_controller.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();
  final _repository = getIt<EventRepository>();
  // -- obs variables
  final favoriteIds = <String>{}.obs;
  final events = <EventModel>[].obs;
  final isLoading = false.obs;
  final isMoreLoading = false.obs;
  final page = 1.obs;
  final hasMore = true.obs;

  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    scrollController.addListener(_onScroll);

    favoriteIds.addAll(FavoriteService.favorites);

    fetchEvents();
  }

  // -- handle scroll for pagination
  void _onScroll() async {
    if (!scrollController.hasClients) return;
    if (!Get.find<ConnectivityController>().isOnline.value) return;

    final threshold = scrollController.position.maxScrollExtent * 0.8;

    if (scrollController.position.pixels >= threshold && !isMoreLoading.value && hasMore.value && !isLoading.value) {
      fetchEvents();
    }
  }

  // -- fetch events with pagination
  Future<void> fetchEvents({bool refresh = false}) async {
    final isOffline = !ConnectivityController.instance.isOnline.value;
    if (refresh && isOffline) return;
    if (isOffline && page.value == 1 && events.isNotEmpty) {
      return;
    }
    if (refresh) {
      page.value = 1;
      hasMore.value = true;
      events.clear();
    }

    // -- no pagination offline
    if (isOffline && page.value > 1) {
      hasMore.value = false;
      return;
    }

    // -- fetch events
    try {
      isLoading.value = page.value == 1;
      isMoreLoading.value = page.value > 1;

      final result = await _repository.fetchEvents(page: page.value);

      if (result.events.isEmpty) {
        hasMore.value = false;
      } else {
        for (final event in result.events) {
          if (!events.any((e) => e.id == event.id)) {
            events.add(event);
          }
        }
        page.value++;
      }
    } catch (e) {
      if (!isOffline && events.isEmpty) {
        Get.snackbar('Error', 'Failed to load events');
      }
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }

  // -- toggle favorite
  void toggleFavorite(String id) {
    FavoriteService.toggleFavorite(id);

    favoriteIds.clear();
    favoriteIds.addAll(FavoriteService.favorites);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
