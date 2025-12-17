import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      // validateStatus: (status) => status != null && status < 500,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json', 'x-api-key': 'reqres-free-v1'},
    ),
  );

  static void setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('➡️ ${options.method} ${options.path}');
          return handler.next(options);
        },
        onError: (error, handler) {
          debugPrint('❌ ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
