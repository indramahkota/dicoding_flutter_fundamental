import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_details_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurants_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_service.g.dart';

@RestApi()
abstract class RestaurantService {
  factory RestaurantService(Dio dio) => _RestaurantService(dio);

  @GET('/list')
  Future<RestaurantsResponse> getListRestaurant();

  @GET('/detail/{id}')
  Future<RestaurantDetailsResponse> getDetailRestaurant({
    @Path('id') String? id,
  });
}
