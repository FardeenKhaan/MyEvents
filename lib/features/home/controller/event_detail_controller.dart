import 'package:get/get.dart';
import 'package:my_events/data/models/event_model.dart';
import 'package:my_events/data/repositories/event_repository.dart';
import 'package:my_events/data/services/get_it/get_it.dart';

class EventDetailController extends GetxController {
  static EventDetailController get instance => Get.find();
  // final EventRepository _repo = EventRepository();
  final _repository = getIt<EventRepository>();

  final event = Rxn<EventModel>();
  final isLoading = false.obs;
  final isRegistering = false.obs;

  late final String eventId;

  @override
  void onInit() {
    super.onInit();
    eventId = Get.parameters['id']!;
    fetchEventDetail();
  }

  Future<void> fetchEventDetail() async {
    try {
      isLoading.value = true;
      event.value = await _repository.fetchEventDetail(eventId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load event');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerEvent() async {
    try {
      isRegistering.value = true;
      await _repository.registerForEvent(eventId);
      Get.snackbar('Success', 'Registered successfully');
    } catch (e) {
      Get.snackbar('Error', 'Registration failed');
    } finally {
      isRegistering.value = false;
    }
  }
}
