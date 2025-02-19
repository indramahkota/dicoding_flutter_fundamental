import 'package:dicoding_flutter_fundamental/flavors.dart';
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  @singleton
  String get baseUrl => F.baseUrl;

  @singleton
  Dio dio(@Named('base_url') String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    final dio = Dio(options);

    // Logger instance for better debugging
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to show in stack trace
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );

    // Custom Log Interceptor (useful for structured logging)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.i("➡️ [${options.method}] ${options.uri}");
        if (F.isDebug) {
          logger.d("Headers: ${options.headers}");
          logger.d("Body: ${options.data}");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i("✅ [${response.statusCode}] ${response.requestOptions.uri}");
        if (F.isDebug) {
          logger.d("Response: ${response.data}");
        }
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        logger.e("❌ [${error.response?.statusCode}] ${error.requestOptions.uri}");
        logger.e("Error: ${error.message}");
        return handler.next(error);
      },
    ));

    // Use Pretty Dio Logger for formatted logs in debug mode
    if (F.isDebug) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return dio;
  }

  @singleton
  RestaurantService service(Dio dio) => RestaurantService(dio);
}
