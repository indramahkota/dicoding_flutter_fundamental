import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_response.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/restaurants_response.dart';

extension RestaurantResponseExt on RestaurantResponse? {
  Restaurant toRestaurant() {
    Menus? menu;
    List<Category> listCategory = [];
    List<CustomerReview> listReview = [];

    if (this?.categories != null) {
      for (var i = 0; i < this!.categories!.length; i++) {
        var data = this!.categories![i];
        listCategory.add(Category(name: data.name ?? ""));
      }
    }

    if (this?.customerReviews != null) {
      for (var i = 0; i < this!.customerReviews!.length; i++) {
        var data = this!.customerReviews![i];
        listReview.add(CustomerReview(
          name: data.name ?? "",
          review: data.review ?? '',
          date: data.date ?? '',
        ));
      }
    }

    if (this?.menus != null) {
      var menusData = this!.menus!;
      List<Category> foods = [];
      List<Category> drinks = [];

      for (var i = 0; i < menusData.foods!.length; i++) {
        var foodData = menusData.foods![i];
        foods.add(Category(name: foodData.name!));
      }

      for (var i = 0; i < menusData.drinks!.length; i++) {
        var drinkData = menusData.drinks![i];
        drinks.add(Category(name: drinkData.name!));
      }

      menu = Menus(foods: foods, drinks: drinks);
    }

    return Restaurant(
      id: this?.id ?? '',
      name: this?.name ?? '',
      description: this?.description ?? '',
      city: this?.city ?? '',
      address: this?.address ?? '',
      pictureId: this?.pictureId ?? '',
      rating: this?.rating ?? 0.0,
      customerReviews: listReview,
      menus: menu,
      categories: listCategory,
    );
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
