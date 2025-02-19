import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/persist/mapper/restaurant_entity_mapper.dart';
import 'package:dicoding_flutter_fundamental/persist/services/local_database_service.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/fetch_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/resource_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/mapper/restaurant_response_mapper.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_details_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurants_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantService _remoteServices;
  final LocalDatabaseService _localDatabaseService;

  RestaurantRepositoryImpl(
    this._remoteServices,
    this._localDatabaseService,
  );

  @override
  Future<Resource<List<Restaurant>>> getListRestaurant() {
    return resourceCommon<List<Restaurant>, RestaurantsResponse>(
      fetch: () => fetch<RestaurantsResponse>(
        () => _remoteServices.getListRestaurant(),
      ),
      mapping: (it) => it.restaurants?.toListRestaurant() ?? [],
    );
  }

  @override
  Future<Resource<Restaurant>> getDetailRestaurant({String? id}) {
    return resourceCommon<Restaurant, RestaurantDetailsResponse>(
        fetch: () => fetch<RestaurantDetailsResponse>(
        () => _remoteServices.getDetailRestaurant(id: id),
      ),
      mapping: (it) => it.toRestaurant(),
    );
  }

  @override
  Future<Resource<int>> insertFavorite(Restaurant restaurant) async {
    try {
      final data = await _localDatabaseService
          .insertItem(restaurant.toRestaurantEntity());
      return Success(data);
    } catch (e) {
      return Error(data: null, message: e.toString());
    }
  }

  @override
  Future<Resource<int>> removeFavorite(String id) async {
    try {
      final data = await _localDatabaseService.removeItem(id);
      return Success(data);
    } catch (e) {
      return Error(data: null, message: e.toString());
    }
  }

  @override
  Future<Resource<List<Restaurant>>> getListFavorite() async {
    try {
      final data = await _localDatabaseService.getAllItems();
      return Success(data.toListRestaurant());
    } catch (e) {
      return Error(data: null, message: e.toString());
    }
  }
}
