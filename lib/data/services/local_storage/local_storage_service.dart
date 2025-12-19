import 'package:get_storage/get_storage.dart';

// class LocalStorageService {
//   static final _box = GetStorage();

//   // 🔑 Keys
//   static const _eventsKey = 'cached_events';
//   static const _eventDetailPrefix = 'cached_event_';

//   /// Save event list
//   static void saveEvents(List<Map<String, dynamic>> events) {
//     _box.write(_eventsKey, events);
//   }

//   /// Read event list
//   static List<Map<String, dynamic>>? getEvents() {
//     return _box.read<List>(_eventsKey)?.cast<Map<String, dynamic>>();
//   }

//   /// Save single event detail
//   static void saveEventDetail(String id, Map<String, dynamic> event) {
//     _box.write('$_eventDetailPrefix$id', event);
//   }

//   /// Read single event detail
//   static Map<String, dynamic>? getEventDetail(String id) {
//     return _box.read<Map<String, dynamic>>('$_eventDetailPrefix$id');
//   }

//   static void clearAll() {
//     _box.erase();
//   }
// }

class LocalStorageService {
  static final _box = GetStorage();

  static const _eventsKey = 'cached_events';
  static const _eventDetailPrefix = 'cached_event_';

  static void saveEvents(List<Map<String, dynamic>> events) {
    _box.write(_eventsKey, events);
  }

  static List<Map<String, dynamic>>? getEvents() {
    return _box.read<List>(_eventsKey)?.cast<Map<String, dynamic>>();
  }

  static void saveEventDetail(String id, Map<String, dynamic> event) {
    _box.write('$_eventDetailPrefix$id', event);
  }

  static void clearEvents() {
    _box.remove('cached_events');
  }

  static Map<String, dynamic>? getEventDetail(String id) {
    return _box.read<Map<String, dynamic>>('$_eventDetailPrefix$id');
  }
}
