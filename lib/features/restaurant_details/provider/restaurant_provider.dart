import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantRepository repository = GetIt.I.get<RestaurantRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Restaurant _restaurant = Restaurant();

  Restaurant get restaurant => _restaurant;

  void getDetailRestaurant({required String id}) async {
    _isLoading = true;
    notifyListeners();

    var result = await repository.getDetailRestaurant(id: id);

    switch (result) {
      case Success<Restaurant>():
        _restaurant = result.data!;
      case Error<Restaurant>():
        _errorMessage = result.message;
    }

    _isLoading = false;
    notifyListeners();
  }
}
