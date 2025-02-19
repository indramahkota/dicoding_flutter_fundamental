import 'package:dicoding_flutter_fundamental/core/domain/list_item.dart';
import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:flutter/foundation.dart';

class RestaurantsProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  List<ListItem> _items = [];

  List<ListItem> get items => _items;

  RestaurantsProvider(this.repository);

  Future<void> getListRestaurant() async {
    _items = [HeaderItem(), LoadingItem()];
    notifyListeners();

    final result = await repository.getListRestaurant();
    switch (result) {
      case Success<List<Restaurant>>():
        final restaurants = result.data!;
        if (restaurants.isEmpty) {
          _items = [HeaderItem(), EmptyItem()];
        } else {
          _items = [
            HeaderItem(),
            ...restaurants.map((restaurant) => ContentItem(restaurant)),
          ];
        }
      case Error<List<Restaurant>>():
        _items = [
          HeaderItem(),
          ErrorItem(result.message ?? "Unknown Error"),
        ];
    }
    notifyListeners();
  }
}
