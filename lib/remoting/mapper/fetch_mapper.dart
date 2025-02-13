import 'package:dicoding_flutter_fundamental/remoting/responses/api_response.dart';
import 'package:dio/dio.dart';

Future<ApiResponse<T>> fetch<T>(Future<T> Function() block) async {
  try {
    return ApiResponse.create(await block());
  } on DioException catch (e) {
    return ApiResponse.createError(getErrorMessage(e));
  }
}

String getErrorMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timed out. Please check your internet connection and try again.";

    case DioExceptionType.sendTimeout:
      return "Request timed out while sending data. Please try again later.";

    case DioExceptionType.receiveTimeout:
      return "Server took too long to respond. Please try again later.";

    case DioExceptionType.badCertificate:
      return "Security error: Invalid SSL certificate. Please check your connection.";

    case DioExceptionType.badResponse:
      return "Server returned an unexpected response. Please try again later.";

    case DioExceptionType.cancel:
      return "Request was canceled. Please try again.";

    case DioExceptionType.connectionError:
      return "Failed to connect to the server. Please check your internet connection.";

    case DioExceptionType.unknown:
      return "An unexpected error occurred. Please try again later.";
  }
}
