import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @Singleton(as: RestaurantRepository)
  RestaurantRepositoryImpl get restaurantRepository;
}
