import 'package:get/get.dart';
import 'package:my_events/data/models/event_model.dart';
import 'package:my_events/data/repositories/event_repository.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/features/home/controller/connectivity_controller.dart';
import 'package:my_events/features/home/controller/event_controller.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';

class EventDetailController extends GetxController {
  static EventDetailController get instance => Get.find();
  final _repository = getIt<EventRepository>();

  // -- obs variables
  final event = Rxn<EventModel>();
  final isLoading = false.obs;
  final isRegistering = false.obs;

  late final String eventId;

  @override
  void onInit() {
    super.onInit();
    eventId = Get.parameters['id']!;

    // -- preload from list cache
    final listEvent = EventController.instance.events.firstWhereOrNull((e) => e.id == eventId);

    if (listEvent != null) {
      event.value = listEvent;
    }

    fetchEventDetail();
  }

  // -- update event details
  void updateEvent(EventModel updated) {
    event.value = updated;
  }

  // -- fetch event detail
  Future<void> fetchEventDetail() async {
    final isOffline = !Get.find<ConnectivityController>().isOnline.value;

    try {
      isLoading.value = true;
      event.value = await _repository.fetchEventDetail(eventId);
    } catch (e) {
      if (!isOffline) {
        FkSnackBarHelpers.errorSnackBar(title: 'Error', message: 'Failed to load events');
      }
    } finally {
      isLoading.value = false;
    }
  }

  // -- register for event
  Future<void> registerEvent() async {
    try {
      isRegistering.value = true;
      await _repository.registerForEvent(eventId);
      FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Registered successfully');
    } catch (e) {
      FkSnackBarHelpers.errorSnackBar(title: 'Error', message: 'Registration failed');
    } finally {
      isRegistering.value = false;
    }
  }
}
