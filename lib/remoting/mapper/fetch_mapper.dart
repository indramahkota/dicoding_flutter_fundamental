import 'package:dicoding_flutter_fundamental/remoting/responses/api_response.dart';
import 'package:dio/dio.dart';

Future<ApiResponse<T>> fetch<T>(Future<T> Function() block) async {
  try {
    return ApiResponse.create(await block());
  } on DioException catch (e) {
    return ApiResponse.createError(e.message ?? 'Unknown Error');
  }
}
