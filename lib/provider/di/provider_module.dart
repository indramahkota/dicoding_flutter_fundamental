import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart';
import 'package:dicoding_flutter_fundamental/provider/bookmark_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurant_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurants_provider.dart';
import 'package:dicoding_flutter_fundamental/provider/settings_provider.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ProviderModule {
  @singleton
  SettingsProvider themeProvider(SharedPreferencesService prefs) =>
      SettingsProvider(prefs);

  @singleton
  RestaurantProvider restaurantProvider(RestaurantRepository repo) =>
      RestaurantProvider(repo);

  @singleton
  RestaurantsProvider restaurantsProvider(RestaurantRepository repo) =>
      RestaurantsProvider(repo);

  @singleton
  BookmarkProvider bookmarkProvider(RestaurantRepository repo) =>
      BookmarkProvider(repo);
}
