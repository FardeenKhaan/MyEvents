import 'package:get_storage/get_storage.dart';
import 'package:my_events/env/keys.dart';

class LocalStorageService {
  // Local storage box
  static final _box = GetStorage();

  static const _eventsKey = FkKeys.eventsKey;
  static const _eventDetailPrefix = FkKeys.eventDetailPrefix;

  // Save list of events
  static void saveEvents(List<Map<String, dynamic>> events) {
    _box.write(_eventsKey, events);
  }

  // Get list of cached events
  static List<Map<String, dynamic>>? getEvents() {
    return _box.read<List>(_eventsKey)?.cast<Map<String, dynamic>>();
  }

  // Save event detail
  static void saveEventDetail(String id, Map<String, dynamic> event) {
    _box.write('$_eventDetailPrefix$id', event);
  }

  // Clear cached events
  static void clearEvents() {
    _box.remove(FkKeys.eventsKey);
  }

  // Get cached event detail
  static Map<String, dynamic>? getEventDetail(String id) {
    return _box.read<Map<String, dynamic>>('$_eventDetailPrefix$id');
  }
}
