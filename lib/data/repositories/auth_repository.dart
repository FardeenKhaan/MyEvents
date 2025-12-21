import 'package:dio/dio.dart';
import 'package:my_events/data/models/api_response_model.dart';
import 'package:my_events/data/services/api/auth_api_service.dart';
import 'package:my_events/data/services/get_it/get_it.dart';
import 'package:my_events/env/api_keys.dart';
import 'package:my_events/env/api_urls.dart';
import '../models/auth_response.dart';

class AuthRepository {
  /// use GetIt
  final ApiServices _apiServices = getIt<ApiServices>();

  // -- ReqRes for login APi
  Future<AuthResponse> login({required String email, required String password}) async {
    try {
      /// API endpoint
      String url = ApiUrls.login;
      // ready the data
      final body = {FkApiKeys.email: email, FkApiKeys.password: password};

      /// Request body
      ApiResponseModel response = await _apiServices.postApi(url: url, body: body);

      /// check response
      if (response.success == true) {
        return AuthResponse.fromJson(response.data);
      }

      throw response.message;
    } on DioException catch (e) {
      throw e.message ?? 'Login failed';
    }
  }

  // -- ReqRes for SignUp APi
  Future<AuthResponse> register({required String email, required String password}) async {
    try {
      /// API endpoint
      String url = ApiUrls.register;
      // ready the data
      final body = {FkApiKeys.email: email, FkApiKeys.password: password};

      /// Request body
      ApiResponseModel response = await _apiServices.postApi(
        url: url,
        body: body,
        // {'email': email, 'password': password}
      );

      /// check response
      if (response.success == true) {
        return AuthResponse.fromJson(response.data);
      }
      throw response.message;
    } on DioException catch (e) {
      throw e.message ?? 'Registration failed';
    }
  }
}
