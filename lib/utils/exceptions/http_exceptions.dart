import 'package:dio/dio.dart';

class FkHttpException implements Exception {
  final String message;

  FkHttpException(this.message);

  @override
  String toString() => message;

  factory FkHttpException.fromStatusCode(Response<dynamic> response) {
    switch (response.statusCode) {
      case 400:
        return FkHttpException('Bad request. Please check your request parameters.');
      case 401:
        return FkHttpException('Unauthorized. Please authenticate and try again.');
      case 402:
        return FkHttpException('Insufficient credits');

      case 403:
        return FkHttpException('Missing API Key');
      case 404:
        return FkHttpException('Not found. The requested resource could not be found.');
      case 405:
        return FkHttpException('Method not allowed. Please use a different HTTP method.');
      case 408:
        return FkHttpException('Request timeout. Please try again later.');
      case 429:
        return FkHttpException('Rate limit exceeded.');
      case 500:
        return FkHttpException('Internal server error occurred. Please try again later.');
      case 502:
        return FkHttpException('Bad gateway. Please try again later.');
      case 503:
        return FkHttpException('Service unavailable. Please try again later.');
      case 504:
        return FkHttpException('Gateway timeout. Please try again later.');
      default:
        return FkHttpException('HTTP error: ${response.statusCode}. Please try again.');
    }
  }

  factory FkHttpException.fromApiCode(String code) {
    switch (code) {
      case 'unknown_foreground':
        return FkHttpException('The object is not clear. Please try another image');
      case 'multiple_sources':
        return FkHttpException('Multiple image sources given. Please try one of them');
      case 'missing_source':
        return FkHttpException('No image given');
      case 'invalid_image_url':
        return FkHttpException('Invalid image_url: Please provide a valid URL.');
      case 'invalid_format':
        return FkHttpException('Invalid format parameter given');
      case 'invalid_roi':
        return FkHttpException('Invalid roi parameter given');
      case 'invalid_semitransparency':
        return FkHttpException('Invalid semitransparency parameter given');
      case 'invalid_crop_margin':
        return FkHttpException('Invalid crop_margin parameter given');
      case 'invalid_scale':
        return FkHttpException('Invalid scale parameter given');
      case 'invalid_position':
        return FkHttpException('Invalid position parameter give');
      case 'invalid_bg_color':
        return FkHttpException('Invalid bg_color parameter given');
      case 'invalid_bg_image_url':
        return FkHttpException('Invalid bg_image_url: Please provide a valid URL.');
      case 'multiple_bg_sources':
        return FkHttpException('Multiple background sources given. Please try one of them');
      case 'failed_bg_download':
        return FkHttpException('Failed to download background image from given image_url');
      case 'failed_image_download':
        return FkHttpException('Failed to download image from given image_url');
      case 'file_too_large':
        return FkHttpException('File too large. File exceeds limit of 22MB');
      case 'invalid_file_type':
        return FkHttpException('Please try jpg/png image type');
      case 'invalid_dimensions':
        return FkHttpException('Failed to read image dimensions');
      case 'resolution_too_high':
        return FkHttpException('Input image has 60 megapixels, maximum supported input resolution is 50 megapixels');
      case 'roi_exceeds_bounds':
        return FkHttpException('The given roi parameter defines a region that exceeds the image bounds');
      case 'roi_region_empty':
        return FkHttpException('The given roi parameter defines an empty region');
      default:
        return FkHttpException('Something went wrong, Please try again.');
    }
  }

  factory FkHttpException.fromMessage(String errorMessage) {
    switch (errorMessage.toLowerCase()) {
      case 'network error':
        return FkHttpException('Network error. Please check your internet connection and try again.');
      case 'server error':
        return FkHttpException('Server error. Please try again later.');
      case 'authentication failed':
        return FkHttpException('Authentication failed. Please authenticate and try again.');
      case 'invalid token':
        return FkHttpException('Invalid token. Please log in again.');
      case 'user not found':
        return FkHttpException('User not found. Please check your credentials.');
      case 'session expired':
        return FkHttpException('Session expired. Please log in again.');
      case 'unexpected server response':
        return FkHttpException('Unexpected server response. Please try again later.');
      case 'unable to connect to server':
        return FkHttpException('Unable to connect to server. Please try again later.');
      // Add more cases as needed...
      default:
        return FkHttpException(errorMessage); // Default to the provided error message
    }
  }
}
