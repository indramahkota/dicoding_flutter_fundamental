import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class RestaurantsProvider extends ChangeNotifier {
  final RestaurantRepository repository = GetIt.I.get<RestaurantRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  void getListRestaurant() async {
    _isLoading = true;
    notifyListeners();

    var result = await repository.getListRestaurant();

    switch (result) {
      case Success<List<Restaurant>>():
        _restaurants = result.data!;
      case Error<List<Restaurant>>():
        _errorMessage = result.message;
    }

    _isLoading = false;
    notifyListeners();
  }
}
