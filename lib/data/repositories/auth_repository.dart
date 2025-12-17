import 'package:dio/dio.dart';
import 'package:my_events/data/services/api/api_service.dart';
import '../models/auth_response.dart';

class AuthRepository {
  final Dio _dio = ApiService.dio;

  Future<AuthResponse> login({required String email, required String password}) async {
    final response = await _dio.post('/login', data: {'email': email, 'password': password});

    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> register({required String email, required String password}) async {
    final response = await _dio.post('/register', data: {'email': email, 'password': password});

    return AuthResponse.fromJson(response.data);
  }
}
