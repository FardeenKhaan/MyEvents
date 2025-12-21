import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_events/data/models/api_response_model.dart';
import 'package:my_events/data/services/api/base_api.dart';
import 'package:my_events/env/api_urls.dart';

class EventApiServices extends BaseApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseURLMockAPI,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  EventApiServices() {
    initializeOptions();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('EVENT ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('EVENT ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint('EVENT ${error.response?.data}');
          return handler.reject(error);
        },
      ),
    );
  }

  @override
  void initializeOptions() {}

  @override
  Future<ApiResponseModel> getApi({required String url, Map<String, dynamic>? parameters}) async {
    final response = await dio.get(url, queryParameters: parameters);
    return ApiResponseModel.fromJson({'success': true, 'message': '', 'data': response.data});
  }

  @override
  Future<ApiResponseModel> postApi({
    required String url,
    Map<String, dynamic>? parameters,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(url, data: body);
    return ApiResponseModel.fromJson({'success': true, 'message': '', 'data': response.data});
  }

  @override
  Future<ApiResponseModel> putApi({required String url, Map<String, dynamic>? parameters, body}) async {
    final response = await dio.put(url, data: body, queryParameters: parameters);
    return ApiResponseModel.fromJson({'success': true, 'message': '', 'data': response.data});
  }

  @override
  Future<ApiResponseModel> deleteApi({required String url, Map<String, dynamic>? parameters}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> patchApi({required String url, Map<String, dynamic>? body}) {
    throw UnimplementedError();
  }
}
