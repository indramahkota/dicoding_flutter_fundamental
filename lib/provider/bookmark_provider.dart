import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:flutter/foundation.dart';

class BookmarkProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  BookmarkProvider(this.repository);

  Future<void> _loadFavorites() async {
    final result = await repository.getListFavorite();
    switch (result) {
      case Success<List<Restaurant>>():
        _restaurants = result.data ?? [];
      case Error<List<Restaurant>>():
        _errorMessage = result.message;
    }
  }

  Future<void> getListFavorite() async {
    _isLoading = true;
    notifyListeners();
    await _loadFavorites();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeFavorite(String id) async {
    _isLoading = true;
    notifyListeners();

    final result = await repository.removeFavorite(id);
    switch (result) {
      case Success<int>():
        await _loadFavorites();
        notifyListeners();
      case Error<int>():
        _errorMessage = result.message;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    _isLoading = true;
    notifyListeners();

    final result = await repository.insertFavorite(restaurant);
    switch (result) {
      case Success<int>():
        await _loadFavorites();
        notifyListeners();
      case Error<int>():
        _errorMessage = result.message;
    }

    _isLoading = false;
    notifyListeners();
  }
}
