import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_events/data/models/event_model.dart';
import 'package:my_events/data/repositories/event_repository.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/data/services/local_storage/local_storage_service.dart';
import 'package:my_events/features/home/controller/event_controller.dart';
import 'package:my_events/features/home/controller/event_detail_controller.dart';
import 'package:my_events/utils/helpers/snackbar_helpers.dart';

class CreateEditEventController extends GetxController {
  final eventController = EventController.instance;
  final EventRepository _repository = getIt<EventRepository>();

  //-- form fields
  final title = TextEditingController();
  final description = TextEditingController();
  final city = TextEditingController();
  final date = TextEditingController();

  //-- obs variables
  final isLoading = false.obs;
  final isEdit = false.obs;

  String? eventId;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    //-- check if edit mode
    if (Get.parameters['id'] != null) {
      isEdit.value = true;
      eventId = Get.parameters['id'];
      _loadEvent();
    }
  }

  // -- load event details into form fields
  void _loadEvent() {
    final event = Get.arguments as EventModel;
    title.text = event.title;
    description.text = event.description;
    city.text = event.city;
    date.text = event.date.toIso8601String();
  }

  // -- submit create or edit event
  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final body = {
      'title': title.text.trim(),
      'description': description.text.trim(),
      'city': city.text.trim(),
      'date': date.text.trim(),
      'image': 'https://picsum.photos/300',
    };

    // -- create or update event
    try {
      if (isEdit.value) {
        final success = await _repository.updateEvent(eventId!, body);

        // if (success) {
        //   // -- update in list
        //   final index = eventController.events.indexWhere((e) => e.id == eventId);
        //   if (index != -1) {
        //     eventController.events[index] = eventController.events[index].copyWith(
        //       title: title.text,
        //       description: description.text,
        //       city: city.text,
        //     );
        //   }
        //   Get.back();
        //   FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Event updated');
        // }
        if (success) {
          final index = eventController.events.indexWhere((e) => e.id == eventId);

          if (index != -1) {
            final updatedEvent = eventController.events[index].copyWith(
              title: title.text,
              description: description.text,
              city: city.text,
            );

            /// Update list (home)
            eventController.events[index] = updatedEvent;

            /// Update detail (if open)
            if (Get.isRegistered<EventDetailController>()) {
              EventDetailController.instance.updateEvent(updatedEvent);
            }
          }

          Get.back();
          FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Event updated');
        }
      } else {
        await _repository.createEvent(body);
        LocalStorageService.clearEvents();
        await eventController.fetchEvents(refresh: true);
        Get.back();
        FkSnackBarHelpers.successSnackBar(title: 'Success', message: 'Event created');
      }
    } catch (e) {
      FkSnackBarHelpers.errorSnackBar(title: 'Error', message: 'Action failed. Check connection.');
    } finally {
      isLoading.value = false;
    }
  }
}
