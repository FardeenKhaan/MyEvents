import 'package:my_events/data/models/event_model.dart';

class EventFetchResult {
  final List<EventModel> events;
  final bool fromCache;

  EventFetchResult(this.events, {this.fromCache = false});
}
