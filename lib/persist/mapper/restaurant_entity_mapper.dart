import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/persist/entity/restaurant_entity.dart';

extension RestaurantExt on Restaurant {
  RestaurantEntity toRestaurantEntity() {
    return RestaurantEntity(
      id: id,
      name: name,
      city: city,
      pictureId: pictureId,
      rating: rating,
    );
  }
}

extension ListRestaurantExt on List<Restaurant> {
  List<RestaurantEntity> toListRestaurantEntity() {
    List<RestaurantEntity> listRestaurant = [];
    for (var i = 0; i < length; i++) {
      var data = this[i];
      listRestaurant.add(data.toRestaurantEntity());
    }
    return listRestaurant;
  }
}

extension RestaurantEntityExt on RestaurantEntity? {
  Restaurant toRestaurant() {
    return Restaurant(
      id: this?.id ?? '',
      name: this?.name ?? '',
      city: this?.city ?? '',
      pictureId: this?.pictureId ?? '',
      rating: this?.rating ?? 0.0,
    );
  }
}

extension ListRestaurantEntityExt on List<RestaurantEntity> {
  List<Restaurant> toListRestaurant() {
    List<Restaurant> listRestaurant = [];
    for (var i = 0; i < length; i++) {
      var data = this[i];
      listRestaurant.add(data.toRestaurant());
    }
    return listRestaurant;
  }
}
