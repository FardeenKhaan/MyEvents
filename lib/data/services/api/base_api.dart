import 'package:my_events/data/models/api_response_model.dart';

abstract class BaseApiServices {
  Future<ApiResponseModel> getApi({required String url, Map<String, dynamic>? parameters});
  Future<ApiResponseModel> postApi({required String url, Map<String, dynamic>? parameters, dynamic body});
  Future<ApiResponseModel> putApi({required String url, Map<String, dynamic>? parameters, dynamic body});
  Future<ApiResponseModel> deleteApi({required String url, Map<String, dynamic>? parameters});
  Future<ApiResponseModel> patchApi({required String url, Map<String, dynamic>? body});
  void initializeOptions();
}
