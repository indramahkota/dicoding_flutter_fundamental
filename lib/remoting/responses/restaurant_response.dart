import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse extends BaseResponse {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "pictureId")
  final String? pictureId;
  @JsonKey(name: "categories")
  final List<CategoryResponse>? categories;
  @JsonKey(name: "menus")
  final MenusResponse? menus;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "customerReviews")
  final List<CustomerReviewResponse>? customerReviews;

  RestaurantResponse({
    super.error,
    super.message,
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "name")
  final String? name;

  CategoryResponse({
    this.name,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class CustomerReviewResponse {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "review")
  final String? review;
  @JsonKey(name: "date")
  final String? date;

  CustomerReviewResponse({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewResponseFromJson(json);
}

@JsonSerializable()
class MenusResponse {
  @JsonKey(name: "foods")
  final List<CategoryResponse>? foods;
  @JsonKey(name: "drinks")
  final List<CategoryResponse>? drinks;

  MenusResponse({
    this.foods,
    this.drinks,
  });

  factory MenusResponse.fromJson(Map<String, dynamic> json) =>
      _$MenusResponseFromJson(json);
}
