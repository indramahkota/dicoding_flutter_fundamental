import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_details_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurants_response.dart';

extension RestaurantResponseExt on RestaurantResponse? {
  Restaurant toRestaurant() {
    return Restaurant(
      id: this?.id ?? '',
      name: this?.name ?? '',
      description: this?.description ?? '',
      city: this?.city ?? '',
      address: this?.address ?? '',
      pictureId: this?.pictureId ?? '',
      rating: this?.rating ?? 0.0,
      categories: this
              ?.categories
              ?.map((data) => Category(name: data.name ?? ""))
              .toList() ??
          [],
      customerReviews: this
              ?.customerReviews
              ?.map((data) => CustomerReview(
                    name: data.name ?? "",
                    review: data.review ?? '',
                    date: data.date ?? '',
                  ))
              .toList() ??
          [],
      menus: this?.menus != null
          ? Menus(
              foods: this!
                      .menus!
                      .foods
                      ?.map((food) => Category(name: food.name ?? ""))
                      .toList() ??
                  [],
              drinks: this!
                      .menus!
                      .drinks
                      ?.map((drink) => Category(name: drink.name ?? ""))
                      .toList() ??
                  [],
            )
          : null,
    );
  }
}

extension RestaurantDetailsResponseExt on RestaurantDetailsResponse {
  Restaurant toRestaurant() {
    return restaurant.toRestaurant();
  }
}

extension ListRestaurantResponseExt on List<RestaurantResponse> {
  List<Restaurant> toListRestaurant() {
    List<Restaurant> listRestaurant = [];
    for (var i = 0; i < length; i++) {
      var data = this[i];
      listRestaurant.add(data.toRestaurant());
    }
    return listRestaurant;
  }
}

extension RestaurantsResponseExt on RestaurantsResponse? {
  List<Restaurant> toListRestaurant() {
    return this?.restaurants?.map((e) => e.toRestaurant()).toList() ?? [];
  }
}
