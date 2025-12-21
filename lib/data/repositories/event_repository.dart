import 'package:dio/dio.dart';
import 'package:my_events/data/models/api_response_model.dart';
import 'package:my_events/data/services/api/event_api_service.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/data/services/local_storage/local_storage_service.dart';
import 'package:my_events/data/services/wrapper/event_fetch_result.dart';
import 'package:my_events/env/api_urls.dart';
import 'package:my_events/env/keys.dart';
import '../models/event_model.dart';

class EventRepository {
  ///
  final EventApiServices _apiServices = getIt<EventApiServices>();

  /// [GET] Events list (pagination)
  Future<EventFetchResult> fetchEvents({required int page}) async {
    try {
      /// API endpoint
      String url = ApiUrls.events;

      /// Request body
      final response = await _apiServices.getApi(url: url, parameters: {'page': page, 'limit': 10});

      final list = (response.data as List).map((e) => EventModel.fromJson(e)).toList();

      if (page == 1) {
        LocalStorageService.saveEvents((response.data as List).cast<Map<String, dynamic>>());
      }

      return EventFetchResult(list);
    } catch (_) {
      // If page 1 and we have cache, return cached data without throwing error
      if (page == 1) {
        final cached = LocalStorageService.getEvents();
        if (cached != null && cached.isNotEmpty) {
          return EventFetchResult(cached.map((e) => EventModel.fromJson(e)).toList(), fromCache: true);
        }
      }
      // Only throw error if no cache available
      rethrow;
    }
  }

  /// [GET] Event detail
  Future<EventModel> fetchEventDetail(String id) async {
    try {
      /// API endpoint
      String url = ApiUrls.eventDetails(id);

      /// Request body
      ApiResponseModel response = await _apiServices.getApi(url: url);

      if (response.success == true) {
        LocalStorageService.saveEventDetail(id, response.data as Map<String, dynamic>);

        return EventModel.fromJson(response.data);
      }

      throw Exception('Event not found');
    } catch (e) {
      final cached = LocalStorageService.getEventDetail(id);
      if (cached != null) {
        return EventModel.fromJson(cached);
      }

      rethrow;
    }
  }

  /// [POST] Register for event (ONLINE ONLY)
  Future<bool> registerForEvent(String eventId) async {
    try {
      /// API endpoint
      String url = ApiUrls.registrationsDummy;

      final body = {FkKeys.eventId: eventId};
      ApiResponseModel response = await _apiServices.postApi(
        url: url,
        body: body,
        // {'eventId': eventId}
      );

      return response.success == true;
    } on DioException catch (e) {
      throw e.message ?? 'Event registration failed';
    }
  }

  /// [POST] Create Event
  Future<EventModel> createEvent(Map<String, dynamic> body) async {
    try {
      /// API endpoint
      String url = ApiUrls.events;

      /// Request body
      ApiResponseModel response = await _apiServices.postApi(url: url, body: body);

      return EventModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message ?? 'Event Creation failed';
    }
  }

  /// [PUT] Update Event
  Future<bool> updateEvent(String id, Map<String, dynamic> body) async {
    /// API endpoint
    String url = ApiUrls.eventDetails(id);
    ApiResponseModel response = await _apiServices.putApi(url: url, body: body);
    return response.success == true;
  }
}
