import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:flutter/cupertino.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Restaurant _restaurant = Restaurant();

  Restaurant get restaurant => _restaurant;

  RestaurantProvider(this.repository);

  Future<void> getDetailRestaurant({required String id}) async {
    _isLoading = true;
    notifyListeners();

    final result = await repository.getDetailRestaurant(id: id);

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
