import 'package:dicoding_flutter_fundamental/flavors.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository_impl.dart';
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  @singleton
  String get baseUrl => F.baseUrl;

  @singleton
  Dio dio(@Named('base_url') String baseUrl) {
    var option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    var dio = Dio(option);
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    return dio;
  }

  @singleton
  RestaurantService service(Dio dio) => RestaurantService(dio);

  @Singleton(as: RestaurantRepository)
  RestaurantRepositoryImpl get restaurantRepository;
}
