import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/fetch_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/resource_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/restaurant_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_details_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurants_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantService _services;

  RestaurantRepositoryImpl(this._services);

  @override
  Future<Resource<List<Restaurant>>> getListRestaurant() {
    return resourceCommon<List<Restaurant>, RestaurantsResponse>(
      fetch: () =>
          fetch<RestaurantsResponse>(() => _services.getListRestaurant()),
      mapping: (it) => it.restaurants?.toListRestaurant() ?? [],
    );
  }

  @override
  Future<Resource<Restaurant>> getDetailRestaurant({String? id}) {
    return resourceCommon<Restaurant, RestaurantDetailsResponse>(
        fetch: () => fetch<RestaurantDetailsResponse>(
            () => _services.getDetailRestaurant(id: id)),
        mapping: (it) => it.toRestaurant());
  }
}
