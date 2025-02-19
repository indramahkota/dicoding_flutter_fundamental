import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';

abstract class RestaurantRepository {
  Future<Resource<List<Restaurant>>> getListRestaurant();

  Future<Resource<Restaurant>> getDetailRestaurant({String? id,});

  Future<Resource<int>> insertFavorite(Restaurant restaurant);

  Future<Resource<int>> removeFavorite(String id);

  Future<Resource<List<Restaurant>>> getListFavorite();
}
