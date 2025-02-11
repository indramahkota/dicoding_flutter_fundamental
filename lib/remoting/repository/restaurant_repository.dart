import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';

abstract class RestaurantRepository {
  Future<Resource<List<Restaurant>>> getListRestaurant();

  Future<Resource<Restaurant>> getDetailRestaurant({String? id,});
}
