import 'package:dicoding_flutter_fundamental/core/domain/list_item.dart';
import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/provider/restaurants_provider.dart';
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  late MockRestaurantRepository mockRestaurantRepository;
  late RestaurantsProvider restaurantsProvider;

  setUp(() {
    mockRestaurantRepository = MockRestaurantRepository();
    restaurantsProvider = RestaurantsProvider(mockRestaurantRepository);
  });

  group('RestaurantsProvider', () {
    test('initial provider state is defined', () {
      final initState = restaurantsProvider.items;
      expect(initState, equals([]));
    });

    test('should return list of restaurants when API fetch is successful',
        () async {
      final restaurants = [
        Restaurant(id: '1', name: 'Restaurant 1'),
        Restaurant(id: '2', name: 'Restaurant 2'),
      ];

      when(() => mockRestaurantRepository.getListRestaurant())
          .thenAnswer((_) async => Success(restaurants));

      await restaurantsProvider.getListRestaurant();
      final items = restaurantsProvider.items;

      expect(items.first, isA<HeaderItem>());
      expect(items.length, equals(1 + restaurants.length));
      for (var i = 1; i < items.length; i++) {
        expect(items[i], isA<ContentItem>());
      }
    });

    test('returns an error when API fetch fails', () async {
      final errorMessage = 'Failed to fetch restaurants';

      when(() => mockRestaurantRepository.getListRestaurant())
          .thenAnswer((_) async => Error(message: errorMessage));

      await restaurantsProvider.getListRestaurant();
      final items = restaurantsProvider.items;

      expect(items.length, equals(2));
      expect(items.first, isA<HeaderItem>());
      expect(items[1], isA<ErrorItem>());
    });
  });
}
