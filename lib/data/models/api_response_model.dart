// as i use mockAPI and ReqRes structure so there response back is not similar to this model, but it's an standardize approach

class ApiResponseModel {
  final bool? success;
  final String message;
  final dynamic data;

  ApiResponseModel({this.success, required this.message, this.data});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(success: json['success'], message: json['message'] ?? '', data: json['data']);
  }
}
